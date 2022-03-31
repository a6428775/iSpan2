package tw.chen.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class ResourcesController {
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@Value("classpath:static/images/images03.jpg")
	private Resource resource;
	
	@GetMapping(path="/resourceaction.controller",produces = MediaType.IMAGE_JPEG_VALUE)
	public byte[] processResourceAction() throws IOException {
		File file3 = resource.getFile();
		System.out.println(file3.getName()+"\n"+file3.getPath()+"\n"+file3.length());
		
		InputStream is3 = resource.getInputStream();
		return IOUtils.toByteArray(is3);
	}

	@GetMapping(path="/resourceloader.controller",produces = MediaType.IMAGE_JPEG_VALUE)
	public byte[] processresourceLoaderAction() throws IOException {
		Resource resource = resourceLoader.getResource("classpath:static/images/images04.jpg"); 
		
		File file2 = resource.getFile();
		System.out.println(file2.getName()+"\n"+file2.getPath()+"\n"+file2.length());
		
		InputStream is2 = resource.getInputStream();
		return IOUtils.toByteArray(is2);
	}
	
	@GetMapping(path="/classpathresource.controller", produces =MediaType.IMAGE_JPEG_VALUE)
	public byte[] processClassPathResourceAction() throws IOException {
		Resource resource = new ClassPathResource("static/images/images04.jpg");
		File file1 = resource.getFile();
		System.out.println(file1.getName()+"\n"+file1.getPath()+"\n"+file1.length());
		
		InputStream is1 = resource.getInputStream();
		return IOUtils.toByteArray(is1);
	}
}
