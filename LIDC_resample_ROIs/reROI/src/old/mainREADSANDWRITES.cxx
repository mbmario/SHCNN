#include "itkImage.h"
#include "itkImageFileReader.h"
#include "itkImageFileWriter.h"
#include "itkRegionOfInterestImageFilter.h"
//#include "itkImageRegionIterator.h"

#include <iostream>
#include <string>
#include "math.h"
#include "string.h"
#include "malloc.h" 

// JUST TRYING TO GET AN OUTPUT. REFER TO LATEST VERSION FOR MATH

int main( int argc, char * argv[] )
{
  typedef itk::Image< int , 3 > ImageType;

  typedef itk::ImageFileReader< ImageType > ReaderType;

  ReaderType::Pointer reader = ReaderType::New();
  reader->SetFileName(argv[1]);
  reader->Update();

  ImageType::SizeType inSize = reader->GetOutput()->GetLargestPossibleRegion().GetSize();

  typedef itk::RegionOfInterestImageFilter< ImageType, ImageType > FilterType;
  FilterType::Pointer filter = FilterType::New();

  ImageType::IndexType start;
  start[0] = inSize[0]/4;
  start[1] = inSize[1]/4;
  start[2] = inSize[2]/4;

  ImageType::SizeType size;
  size[0] = inSize[0]/4;
  size[1] = inSize[1]/4;
  size[2] = inSize[2]/4;

  ImageType::RegionType desiredRegion;
  desiredRegion.SetSize(size);
  desiredRegion.SetIndex(start);

  filter ->SetRegionOfInterest(desiredRegion);
  filter->SetInput(reader->GetOutput());

  // -- end copied stuff from itk example ---

  typedef itk::ImageFileWriter < ImageType > WriterType;
  WriterType::Pointer writer = WriterType::New();
  writer->SetFileName(argv[2]);
  writer->SetInput(filter->GetOutput());

  writer->Update();
  return EXIT_SUCCESS;

}