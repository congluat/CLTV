package job;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import service.VideosStatusCountService;

@Component
public class JobConverter {
	
	@Autowired
	@Qualifier("videosStatusCountService")
	VideosStatusCountService vcs;
	
	
	public void run(){
		if(vcs.getTPending()>=1){
			System.out.println("Pendding >=1: Converter runned");
		}else{
			System.out.println("Converter NOT runned");
		}
		
	}
}
