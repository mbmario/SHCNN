#include "itkImage.h"
#include "itkImageFileReader.h"
#include "itkImageFileWriter.h"

#include "itkCastImageFilter.h"
#include "itkExtractImageFilter.h"

#include <iostream>
#include <string>
#include "math.h"
#include "string.h"
#include "malloc.h" 
#include "intconv.h"

typedef int InputPixelType;
typedef unsigned char OutputPixelType;

typedef itk::Image< InputPixelType, 3 > InputImageType;
typedef itk::Image< InputPixelType, 2 > MiddleImageType;
typedef itk::Image< OutputPixelType, 2 > OutputImageType;


typedef itk::ImageFileReader < InputImageType > ReaderType;

typedef itk::ExtractImageFilter < InputImageType, MiddleImageType > ExtractFilterType;
typedef itk::CastImageFilter < MiddleImageType, OutputImageType > CastFilterType; 

typedef itk::ImageFileWriter < OutputImageType > WriterType; 


void each_slice(ReaderType::Pointer reader, InputImageType::SizeType full_size, std::string outname, int dim, void * pimg ) {



  // ### PART 1: ExtractImageFilter ### //

  


  // get output filename and set width/height
  



  // extractFilter settings
  ExtractFilterType::Pointer extractFilter = ExtractFilterType::New();
  extractFilter->SetExtractionRegion(desiredRegion); // changed from SetRegionOfInterest
  extractFilter->SetInput(reader->GetOutput());
  extractFilter->SetDirectionCollapseToIdentity(); // option 1
  //extractFilter->SetDirectionCollapseToSubmatrix(); // option 2
  
  // output of pt 1: the image 
  MiddleImageType::Pointer *kimg = (MiddleImageType::Pointer *)pimg;
  *kimg = extractFilter->GetOutput();
//  MiddleImageType::Pointer image = extractFilter->GetOutput();


  // ### PART 2: Manually reset the Pixel values ### 
  //MiddleImageType::RegionType region = kimg->GetLargestPossibleRegion();
  //MiddleImageType::SizeType middle_size = region.GetSize();
 // std::cout << "GetLargestPossibleRegion " << middle_size << std::endl;

  itk::ImageRegionIterator<MiddleImageType> it(*kimg, *kimg->GetLargestPossibleRegion());

  it.GoToBegin();

  while( !it.IsAtEnd() ) {
    std::cout << "iterator worked" << std::endl;
    std::cout << it.Value() << std::endl;
    ++it;
  }

  int abc;
  int csa;

  
  // set the iterator on the image and region


  // iterate over the image and change the pixel values



  // set the filter 

  //filter->SetDirectionCollapseToIdentity(); // option 1
  /*filter->SetDirectionCollapseToSubmatrix(); // option 2

  // set the writer
  WriterType::Pointer writer = WriterType::New();
  writer->SetFileName(resultname);
  writer->SetInput(filter->GetOutput());

  writer->Update(); 
  */
}