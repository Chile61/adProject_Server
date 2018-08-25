package com.stylefeng.guns.zy.modular.apk.controller;

import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.util.ToolUtil;
import io.swagger.annotations.ApiOperation;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.*;

//import com.stylefeng.guns.zy.core.log.LogObjectHolder;

/**
 * 图片控制器
 *
 * @author fengshuonan
 * @Date 2018-01-01 14:44:05
 */
@Controller
@RequestMapping("/apk")
public class ApkController extends BaseController {

    private ResourceLoader loader = new DefaultResourceLoader();

    /**
     * 下载APK
     */
    @ApiOperation(value = "下载APK", notes = "下载APK")
    @RequestMapping(value = "/download", method = RequestMethod.GET)
    @ResponseBody
    public void download(HttpServletResponse response) {
        String filename = "zy.apk";
        try {
            File file = new File(ToolUtil.getJarPath(this, "zyAssets/apk/") + filename);
            if (file.exists()) {
                String dfileName = file.getName();
                InputStream fis = new BufferedInputStream(new FileInputStream(file));
                response.reset();
                response.setContentType("application/x-download");
                response.addHeader("Content-Disposition", "attachment;filename=" + new String(dfileName.getBytes(), "iso-8859-1"));
                response.addHeader("Content-Length", "" + file.length());
                OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
                response.setContentType("application/octet-stream");
                byte[] buffer = new byte[1024 * 1024 * 4];
                int i = -1;
                try {
                    while ((i = fis.read(buffer)) != -1) {
                        toClient.write(buffer, 0, i);

                    }
                    fis.close();
                    toClient.flush();
                    toClient.close();

                    response.wait();
                } catch (InterruptedException e) {
                    //e.printStackTrace();
                } finally {
                    fis.close();
                    toClient.close();
                }
            }
        } catch (IOException ex) {
            //ex.printStackTrace();
        }
    }

    /**
     * 更新APK
     */
    @ApiOperation(value = "下载APK", notes = "下载APK")
    @RequestMapping(value = "/updateApk/{filename:.+}", method = RequestMethod.GET)
    @ResponseBody
    public void updateApk(@PathVariable String filename,
                                       HttpServletResponse response) throws IOException {
//        File file = new File(ToolUtil.getJarPath(this, "zyAssets/apk/")+filename);
//        System.out.println("aa:");
//        InputStream in;
//        if(file.exists()){
//            System.out.println("bb:"+file.length());
//            HttpHeaders headers = new HttpHeaders();
//            response.setContentType("application/x-download");
//            headers.set("Content-Disposition", "attachment;filename=" + filename);
//            headers.set("Content-Length", "" + file.length());
//            headers.setContentDispositionFormData("attachment", filename);
//
//            in = new FileInputStream(file);
//            byte[] buffer = new byte[1024 * 1024 * 4];
//            //byte[] b = new byte[in.available()];
//            OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
//            //in.read(b);
//            int i = -1;
//            while ((i = in.read(buffer)) != -1) {
//                        toClient.write(buffer, 0, i);
//                    }
//            HttpStatus statusCode = HttpStatus.OK;
//            ResponseEntity<byte[]> responseEntity = new ResponseEntity<byte[]>(toClient, headers, statusCode);
//            in.close();
//            return responseEntity;
////            byte[] bytes = FileUtils.readFileToByteArray(file);
////            if(bytes != null){
////                System.out.println("cc:"+ bytes.length);
////                return new ResponseEntity<>(bytes,
////                        headers, HttpStatus.OK);
////            }
//        }
//        return null;

        try {
            File file = new File(ToolUtil.getJarPath(this, "zyAssets/apk/") + filename);
            if (file.exists()) {
                String dfileName = file.getName();
                InputStream fis = new BufferedInputStream(new FileInputStream(file));
                response.reset();
                response.setContentType("application/x-download");
                response.addHeader("Content-Disposition", "attachment;filename=" + new String(dfileName.getBytes(), "iso-8859-1"));
                response.addHeader("Content-Length", "" + file.length());
                OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
                response.setContentType("application/octet-stream");
                byte[] buffer = new byte[1024 * 1024 * 4];
                int i = -1;
                try {
                    while ((i = fis.read(buffer)) != -1) {
                        toClient.write(buffer, 0, i);

                    }
                    fis.close();
                    toClient.flush();
                    toClient.close();

                    response.wait();
                } catch (InterruptedException e) {
                    //e.printStackTrace();
                } finally {
                    fis.close();
                    toClient.close();
                }
            }
        } catch (IOException ex) {
            //ex.printStackTrace();
        }

    }

//    public ResponseEntity<?> updateApk(@PathVariable String filename) {
//        String path = ToolUtil.getJarPath(this, "zyAssets/apk/")+filename;
//        System.out.println("aa:"+path);
//        File f=new File(path);
//        ResponseEntity<byte[]> response=null ;
//        response = getResponseEntity(filename, f, response);
//        return response;
//    }

    private ResponseEntity<byte[]> getResponseEntity(@PathVariable String filename, File f, ResponseEntity<byte[]> response) {
        InputStream in;
        try {
            in = new FileInputStream(f);
            byte[] b = new byte[in.available()];
            in.read(b);
            HttpHeaders headers = new HttpHeaders();
            //filename = new String(filename.getBytes("gbk"),"iso8859-1");
            headers.add("Content-Type", "application/vnd.android.package-archive");
            headers.add("Content-Disposition", "attachment;filename=" + filename);
            HttpStatus statusCode = HttpStatus.OK;
            response = new ResponseEntity<byte[]>(b, headers, statusCode);
            in.close();
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return response;
    }
}
