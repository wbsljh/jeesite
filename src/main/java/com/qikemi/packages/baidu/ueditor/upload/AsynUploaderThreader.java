package com.qikemi.packages.baidu.ueditor.upload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.log4j.Logger;
import org.json.JSONObject;

import com.aliyun.openservices.oss.OSSClient;
import com.aliyun.openservices.oss.model.Bucket;
import com.aliyun.openservices.oss.model.PutObjectResult;
import com.qikemi.packages.alibaba.aliyun.oss.BucketService;
import com.qikemi.packages.alibaba.aliyun.oss.OSSClientFactory;
import com.qikemi.packages.alibaba.aliyun.oss.ObjectService;
import com.qikemi.packages.alibaba.aliyun.oss.properties.OSSClientProperties;
import com.qikemi.packages.utils.SystemUtil;
import com.thinkgem.jeesite.common.utils.FileUtils;

/**
 * 异步上传文件到阿里云OSS
 */
public class AsynUploaderThreader extends Thread {

	private static Logger logger = Logger.getLogger(AsynUploaderThreader.class);
	private JSONObject stateJson = null;

	public AsynUploaderThreader() {
	}

	public void init(JSONObject stateJson) {
		this.stateJson = stateJson;
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		OSSClient client = OSSClientFactory.createOSSClient();
		
		//modify by bread 20150424
		if (!BucketService.doesBucketExist(client, OSSClientProperties.bucketName)){
			Bucket bucket = BucketService.create(client, OSSClientProperties.bucketName);
		}
		
		// 获取key，即文件的上传路径
		String key = stateJson.getString("url").replaceFirst("/", "");
		String inputfile =  SystemUtil.getProjectRootPath() + key;
		try {
			FileInputStream fileInputStream = new FileInputStream(new File(inputfile));
			/*PutObjectResult result = ObjectService.putObject(client,
					bucket.getName(), key, fileInputStream);*/
			//modify by bread 20150424
			PutObjectResult result = ObjectService.putObject(client,
					OSSClientProperties.bucketName, key, fileInputStream);
			
			System.out.println(result.getETag());
			logger.debug("上传文件到 阿里云 OSS服务器成功。");
		} catch (FileNotFoundException e) {
			logger.error("上传文件到 阿里云 OSS服务器FileNotFoundException。");
		} catch (NumberFormatException e) {
			logger.error("上传文件到 阿里云 OSS服务器NumberFormatException。");
		} catch (IOException e) {
			logger.error("上传文件到 阿里云 OSS服务器IOException。");
		} finally{
			//上传后将临时目录删除
			FileUtils.deleteFile(inputfile);
		}
		// super.run();
	}

}
