#include "itkImage.h"
#include "itkImageFileReader.h"
#include "itkImageFileWriter.h"

#include "itkJoinImageFilter.h"
//#include "itkImageRegionIterator.h"

#include <iostream>
#include <string>
#include "math.h"
#include "string.h"
#include "malloc.h" 

typedef itk::Image < unsigned char, 2 > ImageType;
typedef itk::ImageFileReader < ImageType > ReaderType;
typedef itk::JoinImageFilter < ImageType, ImageType > FilterType;
typedef itk::ImageFileWriter < ImageType > WriterType; 

int main( int argc, char * argv[] ) {
// args: [1] filename; [2] outname

  // reader settings
  ReaderType::Pointer reader = ReaderType::New();
  reader->SetFileName(argv[1]);

  reader->Update();

  // GET DIMENSIONS
  
  ImageType::SizeType inSize = reader->GetOutput()->GetRequestedRegion().GetSize(); // change to GetRequestedRegion?

  // if both dimensions are the same, exit success
  int length;
  if ( inSize[0] == inSize[1] ) {
    return EXIT_SUCCESS;
  } else {
    if ( inSize[0] > inSize[1] ) {
      length = inSize[0];
    } else {
      length = inSize[1];
    }
  }


  // create the bar of zeroes
  ImageType::RegionType region;
 
  ImageType::IndexType start;
  start[0] = 0;
  start[1] = 0;

  ImageType::SizeType size;
  size[0] = 1;
  size[1] = 1;

  if ( inSize[0] > inSize[1] ) { // vertical or horizontal?
    size[0] = length;
  } else {
    size[1] = length;
  }

  region.SetIndex(start);
  region.SetSize(size);

  ImageType::Pointer bar = ImageType::New();
  bar->SetRegions(region);
  bar->Allocate();
  bar->FillBuffer(0); // set all values as 0?


  // filter settings
  //FilterType::Pointer filter = FilterType::New();
  //filter->SetInput1(reader->GetOutput());
  //filter->SetInput2(bar);
  
  //ImageType::Pointer out = filter->GetOutput(); // I CAN'T GET THIS FUNCTION TO WORK SO I HAVE TO DELETE THE FILTER

  // writer settings
  WriterType::Pointer writer = WriterType::New();
  writer->SetFileName(argv[2]); // try to write to the same name
  writer->SetInput(bar);


 writer->Update();
  
  return EXIT_SUCCESS;
}