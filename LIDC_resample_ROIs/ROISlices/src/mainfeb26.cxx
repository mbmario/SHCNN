#include "itkImage.h"
#include "itkImageFileReader.h"
#include "itkImageFileWriter.h"
#include "itkExtractImageFilter.h"

#include <iostream>
#include <string>
#include "math.h"
#include "string.h"
#include "malloc.h" 

// reads the 3d roi analyze image 
// extracts the 3 2d slices from the 3d roi
// saves them 
// don't worry about the combining:  outsource the combining for imagemagick or some other c++ program

typedef int PixelType;

typedef itk::Image< PixelType, 3 > InputImageType;
typedef itk::Image< PixelType, 2 > OutputImageType;

typedef itk::ImageFileReader < InputImageType > ReaderType;
typedef itk::ExtractImageFilter < InputImageType, OutputImageType > FilterType; 
typedef itk::ImageFileWriter < OutputImageType > WriterType;


int main( int argc, char * argv[] ){
  
  if( argc < 4 ) {
      std::cerr << "Usage: " << std::endl;
      std::cerr << argv[0] << " inputImageFile, fn, ext " << std::endl;
      return EXIT_FAILURE;
  }

  // set the reader
  ReaderType::Pointer reader = ReaderType::New();
  reader->SetFileName(argv[1]);
  reader->Update();

  // get the right indices on the image
  InputImageType::SizeType full_size = reader->GetOutput()->GetRequestedRegion().GetSize(); // ex [73, 73, 40]

  
  // make the ExtractionRegion .Size and .Index: [73, 73, 0] and [0,0,19 or 20]
  InputImageType::SizeType size;
  size[0] = full_size[0];
  size[1] = full_size[1];
  size[2] = 0;//full_size[2];

  InputImageType::IndexType index; 
  index[0] = 0;
  index[1] = 0;
  index[2] = (int)(full_size[2] / 2); // rounds up

  // set the region 
  InputImageType:: RegionType desiredRegion;
  desiredRegion.SetSize(size);
  desiredRegion.SetIndex(index);

  // set the filter 
  FilterType::Pointer filter = FilterType::New(); // ExtractImageFilter
  filter->SetExtractionRegion(desiredRegion); // changed from SetRegionOfInterest
  filter->SetInput(reader->GetOutput()); // change to just reader?

  //filter->SetDirectionCollapseToIdentity(); // option 1
  filter->SetDirectionCollapseToSubmatrix(); // option 2

  // set the writer
  std::string fn = *argv[2] + "middle_z" + *argv[3];
  WriterType::Pointer writer = WriterType::New();
  writer->SetFileName(fn);
  writer->SetInput(filter->GetOutput());

  writer->Update(); 


  // RESET FOR DIM[0]: might need new 
  size[0] = 0;
  size[2] = full_size[2];

  index[0] = (int)(full_size[0] / 2);
  index[2] = 0;

  desiredRegion.SetSize(size);
  desiredRegion.SetIndex(index);
  filter->SetExtractionRegion(desiredRegion); // changed from SetRegionOfInterest
  filter->SetInput(reader->GetOutput()); // change to just reader?
  fn = *argv[2] + "middle_x" + *argv[3];
  writer->SetFileName(fn);
  writer->SetInput(filter->GetOutput());

  writer->Update(); 


  // RESET FOR DIM[1]
  size[0] = full_size[0];
  size[1] = 0;

  index[0] = 0;
  index[1] = (int)(full_size[1] / 2);

  desiredRegion.SetSize(size);
  desiredRegion.SetIndex(index);
  filter->SetExtractionRegion(desiredRegion); // changed from SetRegionOfInterest
  filter->SetInput(reader->GetOutput()); // change to just reader?
  fn = *argv[2] + "middle_y" + *argv[3];
  writer->SetFileName(fn);
  writer->SetInput(filter->GetOutput());

  writer->Update(); 


  return EXIT_SUCCESS;
}
