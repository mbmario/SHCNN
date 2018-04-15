#include "itkImage.h"
#include "itkImageFileReader.h"
#include "itkImageFileWriter.h"
#include "itkExtractImageFilter.h"

#include <iostream>
#include <string>
#include "math.h"
#include "string.h"
#include "malloc.h" 
#include "intconv.h"

typedef int PixelType;

typedef itk::Image< PixelType, 3 > InputImageType;
typedef itk::Image< PixelType, 2 > OutputImageType;

typedef itk::ImageFileReader < InputImageType > ReaderType;
typedef itk::ExtractImageFilter < InputImageType, OutputImageType > FilterType; 
typedef itk::ImageFileWriter < OutputImageType > WriterType;



void each_slice(ReaderType::Pointer reader, InputImageType::SizeType full_size, std::string outname, int dim ) {

  InputImageType::SizeType size; // these will be changed
  size[0] = full_size[0];
  size[1] = full_size[1];
  size[2] = full_size[2];

  InputImageType::IndexType index; 
  index[0] = 0;
  index[1] = 0;
  index[2] = 0; 

  // tailor to specific slice
  size[dim] = 0;
  index[dim] = (int)(full_size[dim]/2);

  int ext_idx = outname.find_last_of(".");
  std::string sansext = outname.substr(0, ext_idx);
  std::string ext = outname.substr(ext_idx, outname.length());
  std::string middle;
  
  if (dim == 0 ) {
  	middle = "_fixed_x";
  } else if (dim == 1 ) {
  	middle = "_fixed_y";
  } else { // dim == 2
  	middle = "_fixed_z";
  }

  std::string resultname = sansext + middle + ext;

  // set the region 
  InputImageType:: RegionType desiredRegion;
  desiredRegion.SetSize(size);
  desiredRegion.SetIndex(index);

  // set the filter 
  FilterType::Pointer filter = FilterType::New(); // ExtractImageFilter
  filter->SetExtractionRegion(desiredRegion); // changed from SetRegionOfInterest
  filter->SetInput(reader->GetOutput());

  //filter->SetDirectionCollapseToIdentity(); // option 1
  filter->SetDirectionCollapseToSubmatrix(); // option 2

  // set the writer
  WriterType::Pointer writer = WriterType::New();
  writer->SetFileName(resultname);
  writer->SetInput(filter->GetOutput());

  writer->Update(); 
  
}