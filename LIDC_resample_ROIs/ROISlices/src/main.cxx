#include "itkImage.h"
#include "itkImageFileReader.h"
#include "itkImageFileWriter.h"

#include "itkExtractImageFilter.h"
#include "itkImageRegionIterator.h"
#include "itkCastImageFilter.h"


#include <iostream>
#include <string>
#include "math.h"
#include "string.h"
#include "malloc.h" 

#include "intconv.h"
#include "newname.h"



// reads the 3d roi analyze image 
// extracts the 3 2d slices from the 3d roi
// saves them as bmps
// don't worry about the combining:  outsource the combining for imagemagick or some other c++ program
// I had no choice but to write this in 1 file because image pointers get messed up in functions 

// [reader]--> 3d analyze --[ExtractImageFilter]--> 2d analyze form --[[normalize int values]]--> rescaled 2d analyze form --[CastImageFilter]--> unsigned char bitmap form -->[writer]

typedef int InputPixelType; // analyze is int to accomidate a range of HU
typedef unsigned char OutputPixelType; // .bmp is char 

typedef itk::Image< InputPixelType, 3 > InputImageType; // analyze int 3d
typedef itk::Image< InputPixelType, 2 > MiddleImageType; // int 2d
typedef itk::Image< OutputPixelType, 2 > OutputImageType; // bmp uchar 2d

typedef itk::ImageFileReader < InputImageType > ReaderType;

typedef itk::ExtractImageFilter < InputImageType, MiddleImageType > ExtractFilterType;
typedef itk::CastImageFilter < MiddleImageType, OutputImageType > CastFilterType; 

typedef itk::ImageFileWriter < OutputImageType > WriterType; 




int main( int argc, char * argv[] ){
// [1] inputImage [2] outputImage [3] dimension   
  if( argc < 4 ) {
      std::cerr << "Usage: " << std::endl;
      std::cerr << argv[0] << " inputImageFile, outputImageFile" << std::endl;
      return EXIT_FAILURE;
  }

  int MINH = -800; // min hounsfield units in nodule
  int MAXH = 200; // max hounsfield units in nodule
  
  int dim = atoi(argv[3]);

  std::vector<std::string> args; // so that we may pass the args as strings to newname
  std::copy(argv + 1, argv + argc, std::back_inserter(args));
  
  // set the reader
  ReaderType::Pointer reader = ReaderType::New();
  reader->SetFileName(argv[1]);
  reader->Update();

  // ### PART 1: EXTRACTIMAGEFILTER ### //

  // get the right indices on the image
  InputImageType::SizeType full_size = reader->GetOutput()->GetRequestedRegion().GetSize(); // ex [73, 73, 40]

  InputImageType::IndexType index; // start of image
  index[0] = 0;
  index[1] = 0;
  index[2] = 0; 

  InputImageType::SizeType size; // size of image
  size[0] = full_size[0];
  size[1] = full_size[1];
  size[2] = full_size[2];

  // tailor to specific slice by zeroing/nonzeroing proper dimension
  size[dim] = 0;
  index[dim] = (int)(full_size[dim]/2); // choose the "halfway" slice

  // set the region 
  InputImageType:: RegionType desiredRegion;
  desiredRegion.SetSize(size);
  desiredRegion.SetIndex(index);

  // extractFilter settings: the filter that chops out a dimension
  ExtractFilterType::Pointer extractFilter = ExtractFilterType::New();
  extractFilter->SetExtractionRegion(desiredRegion); // changed from SetRegionOfInterest
  extractFilter->SetInput(reader->GetOutput());
  //extractFilter->SetDirectionCollapseToIdentity(); // option 1
  extractFilter->SetDirectionCollapseToSubmatrix(); // option 2


  // ### PART 2: ITERATOR TO CHANGE PIXEL VALUES ### //

  // get the image from extractFilter
  extractFilter->Update(); // can also be put after next line??
  MiddleImageType::Pointer image = extractFilter->GetOutput();

  itk::ImageRegionIterator<MiddleImageType> it (image, image->GetRequestedRegion());

  it.GoToBegin();

  int val;
  while( !it.IsAtEnd() ) {
    //std::cout << "iterator worked" << std::endl; std::cout << it.Value() << std::endl;
    val = it.Get();
    it.Set(intconv(val, MINH, MAXH));
    ++it;
  }

  // ### PART 3: CASTIMAGEFILTER ### //
  CastFilterType::Pointer castFilter = CastFilterType::New();
  castFilter->SetInput(image);

  // get the result name from custom function in .h
  std::string resultname = newname(args[1], dim);

  //set the writer
  WriterType::Pointer writer = WriterType::New();
  writer->SetFileName(resultname);
  writer->SetInput(castFilter->GetOutput());
  writer->Update();
  
  return EXIT_SUCCESS;
}
