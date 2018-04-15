#include "itkImage.h"
#include "itkImageFileReader.h"
#include "itkExtractImageFilter.h"
#include "itkImageRegionIteratorWithIndex.h"
#include "itkImageFileWriter.h"

#include <iostream> // these for csv2set.h
#include <fstream>
#include <string>
#include <set>
#include <vector>

#include "math.h"

#include "csv2set.h"
#include "csv2minmax.h"

int main( int argc, char * argv[] ) {

  const unsigned int Dimension = 3;
  typedef int PixelType;
  typedef itk::Image< PixelType, Dimension > ImageType;
  
  typedef itk::ImageFileReader< ImageType > ReaderType;
  typedef itk::ExtractImageFilter< ImageType, ImageType > FilterType;
  typedef itk::ImageRegionIteratorWithIndex< ImageType > IteratorType;
  typedef itk::ImageFileWriter< ImageType  > WriterType;

  // args: [1] input analyze ROI [2] input segmentation csv [3] output binary analyze ROI name
  // if this doesn't work, try http://www.itk.org/Doxygen/html/Examples_2Iterators_2ImageLinearIteratorWithIndex_8cxx-example.html with an input and an output

  // If this doesn't work, do the conversion thru another C++ program embedded in the python program and have t
  if( argc < 3 ) {
    std::cerr << "Usage: " << std::endl;
    std::cerr << argv[0] << " inputImageFile " << std::endl;
    return EXIT_FAILURE;
  }

  // Reader: file to image
	ImageType::Pointer inputImage;
	ReaderType::Pointer reader = ReaderType::New();
	reader->SetFileName(argv[1]);  
  //ImageType::Pointer image;
  try{
      reader->Update();
    //  image = reader->GetOutput();
  }
  catch ( itk::ExceptionObject &err) {
      std::cout<<"Problems reading input image"<<std::endl;
      std::cerr << "ExceptionObject caught !" << std::endl;
      std::cerr << err << std::endl;
      return EXIT_FAILURE;
  }

	// Acquire parameters for voxel conversion
	ImageType::PointType origin = reader->GetOutput()->GetOrigin();
	ImageType::SpacingType sp = reader->GetOutput()->GetSpacing();
  ImageType::SizeType input_size = reader->GetOutput()->GetLargestPossibleRegion().GetSize();
	float spz = sp[2]; 
	float orz = origin[2];

	// get set from csv
	std::set< std::vector<float> > segset = csv2set(argv[2]);

  // get mins, maxes from csv
  std::vector<float> minmax = csv2minmax(argv[2]);
  minmax[2] = ((1/spz)*(minmax[2] - orz)); // convert to index
  minmax[5] = ((1/spz)*(minmax[5] - orz)); // convert to index
  
  // define region roi_region on image from minmax vector
  int idxbuffer = 5;
  ImageType::IndexType start;
  start[0] = int(minmax[0]) - idxbuffer;
  start[1] = int(minmax[1]) - idxbuffer;
  start[2] = int(minmax[2]) - idxbuffer;

  ImageType::SizeType size;
  size[0] = int(minmax[3] - minmax[0]) + 2*idxbuffer;
  size[1] = int(minmax[4] - minmax[1]) + 2*idxbuffer;
  size[2] = int(minmax[5] - minmax[2]) + 2*idxbuffer;
 
  ImageType::RegionType desiredRegion;
  desiredRegion.SetIndex(start);
  desiredRegion.SetSize(size);

  // // USE FILTER IF THE OTHER STUFF DOESNT WORK; COMMENT OUT 
  FilterType::Pointer filter = FilterType::New();
  filter->SetExtractionRegion(desiredRegion);
  filter->SetInput(reader->GetOutput());
  try{
      filter->Update();
    //  image = reader->GetOutput();
  }
  catch ( itk::ExceptionObject &err) {
      std::cout<<"Problems reading input image"<<std::endl;
      std::cerr << "ExceptionObject caught on file: " << argv[2] << " !!" << std::endl;
      std::cerr << err << std::endl;
      return EXIT_FAILURE;
  }
  ImageType::Pointer image;
  image = filter->GetOutput();

  ImageType::SizeType size3 = image->GetLargestPossibleRegion().GetSize();
  ImageType::SizeType size2 = image->GetRequestedRegion().GetSize();

  // Iterator: create on image and initialize
	IteratorType it (image,image->GetLargestPossibleRegion());

	//it.GoToBegin(); 

	// dec for loop
	ImageType::IndexType voxidx;
	std::vector<float> segsetidx(3,0.0);  

  // Iterator: iterateq
  while (!it.IsAtEnd()) {

  		ImageType::IndexType voxidx = it.GetIndex(); 
  		// MAY HAVE TO CHANGE THE INT/FLOAT
  		segsetidx[0] = (float)voxidx[0];
  		segsetidx[1] = (float)voxidx[1];
   		segsetidx[2] = (spz * (float)voxidx[2]) + orz; // re-algebra code from reROI
  		if (segset.count(segsetidx) != 0 ) { // converted voxel is found in the segmentation set
  			it.Set(1);
  		} else {
  			it.Set(0);
  		} 
      ++it;
  }

  // Writer: image to file
  WriterType::Pointer writer = WriterType::New();
  writer->SetFileName(argv[3]);
  writer->SetInput(image);
  try
    {
      writer->Update();
    }
  catch ( itk::ExceptionObject &err)
    {
      std::cout<<"Problems writing image"<<std::endl;
      std::cerr << "ExceptionObject caught !" << std::endl;
      std::cerr << err << std::endl;
      return EXIT_FAILURE;
    }
  
  return EXIT_SUCCESS;
}
