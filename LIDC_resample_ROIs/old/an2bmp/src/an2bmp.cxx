// an2bmp.cxx
// takes a single-slice analyze file and normalizes the pixels so that it may 

#include "itkImage.h"
#include "itkImageFileReader.h"
#include "itkImageFileWriter.h"

#include "itkCastImageFilter.h"
#include "itkImageRegionIterator.h"

#include <iostream>
#include <string>
#include "math.h"
#include "string.h"
#include "malloc.h" 

#include "intconv.h"

// procedure: 1) iterate thru the image and convert all pixels to rescaled int
// 2) set up a CastImageFilter and a writer and pipe it

// TYPEDEFS
typedef itk::Image<int, 2> InputImageType;

typedef itk::Image<unsigned char, 2> OutputImageType;

typedef itk::ImageFileReader<InputImageType> ReaderType;
typedef itk::ImageFileWriter<OutputImageType> WriterType;
typedef itk::CastImageFilter<InputImageType, OutputImageType> FilterType;

int main( int argc, char* argv[] ) {
	 
	// args: [1] input analyze, [2] output bitmap
	int MINH = -800;
	int MAXH = 200;

	// set the reader
	ReaderType::Pointer reader = ReaderType::New();
	reader->SetFileName(argv[1]);

	InputImageType::Pointer image = reader->GetOutput(); 


    // do an iterator and rescale the pixel values: InputImageType to InputImageType manual filter

	
	InputImageType::SizeType full_size = image->GetLargestPossibleRegion().GetSize(); // ex [73, 73, 0 or 1? or null]
	InputImageType::SizeType full_size2 = image->GetRequestedRegion().GetSize(); // NONE OF THIS SHIT WILL WORK FOR 2D ANALYZE FILES
	InputImageType::PointType origin = reader->GetOutput()->GetOrigin();

	// region stuff
	InputImageType::IndexType index;
	index[0] = 0;
	index[1] = 0;

	InputImageType::SizeType size;
	size[0] = full_size[0];
	size[1] = full_size[1];

	InputImageType::RegionType region;
	region.SetIndex(index);
	region.SetSize(size);
	
	
	// iterator: doesn't need any typedefs or anything more than this?
	itk::ImageRegionIterator<InputImageType> imageIterator(image, region); // output pixel counts are correct

	int newval; int oldval; // easier to debug!
	while(!imageIterator.IsAtEnd()) {
		oldval = imageIterator.Get();
		newval = intconv(oldval, -800, 200);
		imageIterator.Set(newval);
	}

	// change the pixeltypes with the CastImageFilter
	 FilterType::Pointer filter = FilterType::New();
	 filter->SetInput(image);
	
	// set the writer
	 WriterType::Pointer writer = WriterType::New();
	 writer->SetFileName(argv[2]);
	 writer->SetInput(filter->GetOutput());

	 writer->Update();

	 return EXIT_SUCCESS;

}