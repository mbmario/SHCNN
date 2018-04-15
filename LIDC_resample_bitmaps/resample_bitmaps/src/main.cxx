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

typedef itk::Image<itk::RGBPixel<unsigned char>, 2> ImageType;
typedef itk::ImageFileReader < ImageType > ReaderType;

typedef itk::ExtractImageFilter < ImageType, ImageType > ExtractFilterType;

typedef itk::ImageFileWriter < ImageType > WriterType; 


int main( int argc, char * argv[] ){
	// [1] inputImage [2] outputImage [3] pxradx_arg [4] pxrady_arg   
	if( argc < 4 ) {
      std::cerr << "Usage: " << std::endl;
      std::cerr << argv[0] << " inputImageFile, outputImageFile, mmradius" << std::endl;
      return EXIT_FAILURE;
  	}

  	int pxradx = atoi(argv[3]);
  	int pxrady = atoi(argv[4]);

	// set reader
	ReaderType::Pointer reader = ReaderType::New();
	reader->SetFileName(argv[1]);
  	reader->Update();

	// get region size from mmmradius -> getsize -> numpixels and assume 500mm 
  	ImageType::SizeType fullsize = reader->GetOutput()->GetRequestedRegion().GetSize();

	// set region
	ImageType::IndexType index; // doublecheck old code if this doesn't work
	index[0] = (int)(fullsize[0]/2 - pxradx);
	index[1] = (int)(fullsize[1]/2 - pxrady);

	ImageType::SizeType size;
	size[0] = pxradx*2;
	size[1] = pxrady*2;

	ImageType::RegionType region;
	region.SetIndex(index);
	region.SetSize(size);
	
	// set filter
	ExtractFilterType::Pointer extractFilter = ExtractFilterType::New();
	extractFilter->SetExtractionRegion(region);
	extractFilter->SetInput(reader->GetOutput());
	extractFilter->SetDirectionCollapseToSubmatrix(); // option identity as well

	// set writer
	WriterType::Pointer writer = WriterType::New();
	writer->SetFileName(argv[2]);
	writer->SetInput(extractFilter->GetOutput());
	writer->Update();
  
  return EXIT_SUCCESS;
}
