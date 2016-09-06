package com.cb.system.util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.ConvolveOp;
import java.awt.image.Kernel;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/*******************************************************************************
 * 缩略图类（通用） 本java类能将jpg、bmp、png、gif图片文件，进行等比或非等比的大小转换。 具体使用方法
 * compressPic(大图片路径,生成小图片路径,大图片文件名,生成小图片文名,生成小图片宽度,生成小图片高度,是否等比缩放(默认为true))
 */
public class CompressPicUtil
{ //

	private static float getRatio(int width, int height, int maxWidth, int maxHeight)
	{
		float Ratio = 1.0f;
		float widthRatio;
		float heightRatio;
		widthRatio = (float) maxWidth / width;
		heightRatio = (float) maxHeight / height;
		if(widthRatio < 1.0 || heightRatio < 1.0)
		{
			Ratio = widthRatio <= heightRatio ? widthRatio : heightRatio;
		}
		return Ratio;
	}

	//图片压缩
	public static void compressPic(File file, String outputDir, String outputFileName, int width, int height,
			String imgType)
	{
		try
		{
			Image image = javax.imageio.ImageIO.read(file);
			int imageWidth = image.getWidth(null);
			int imageHeight = image.getHeight(null);
			//if(scale >0.5) scale = 0.5f;//默认压缩比为0.5，压缩比越大，对内存要去越高，可能导致内存溢出
			//按比例计算出来的压缩比
			float realscale = getRatio(imageWidth, imageHeight, width, height);
			float finalScale = Math.min(0.75f, realscale);//取压缩比最小的进行压缩
			if(imageWidth > width)
			{
				imageWidth = (int) (finalScale * imageWidth);
			}
			if(imageHeight > height)
			{
				imageHeight = (int) (finalScale * imageHeight);
			}
			image = image.getScaledInstance(imageWidth, imageHeight, Image.SCALE_AREA_AVERAGING);
			// Make a BufferedImage from the Image.
			BufferedImage mBufferedImage = new BufferedImage(imageWidth, imageHeight, BufferedImage.TYPE_INT_RGB);
			Graphics2D g2 = mBufferedImage.createGraphics();

			g2.drawImage(image, 0, 0, imageWidth, imageHeight, Color.white, null);
			g2.dispose();
			float[] kernelData2 = {-0.125f, -0.125f, -0.125f, -0.125f, 2, -0.125f, -0.125f, -0.125f, -0.125f};
			Kernel kernel = new Kernel(3, 3, kernelData2);
			ConvolveOp cOp = new ConvolveOp(kernel, ConvolveOp.EDGE_NO_OP, null);
			mBufferedImage = cOp.filter(mBufferedImage, null);
			File fileoutputDir = new File(outputDir);
			if(!fileoutputDir.isDirectory())
			{
				fileoutputDir.mkdirs();
			}
			FileOutputStream out = new FileOutputStream(outputDir + outputFileName);
			//JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(bufferedImage);
			//param.setQuality(0.9f, true);
			//encoder.setJPEGEncodeParam(param);
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
			JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(mBufferedImage);
			param.setQuality(0.75f, true);//默认0.75
			encoder.setJPEGEncodeParam(param);
			encoder.encode(mBufferedImage);
			out.close();
		}
		catch (FileNotFoundException fnf)
		{
		}
		catch (IOException ioe)
		{
			ioe.printStackTrace();
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{

		}
	}
}
