package in.flipbay.util;

import java.io.File;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUtil {

	public boolean fileCopyNIO(MultipartFile file, String fileName, String imageDirectory)
	{

		File dest = new File(imageDirectory + fileName);
		try {
			file.transferTo(dest);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} 
	}
}
