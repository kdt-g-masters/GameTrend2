package edu.kdt.gametrend.game;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("gamedto")
public class GameDTO {
	int no;
	String name;
	String explanation;
	String platform;
	String thumbnail;
	int views;
	double rating;
	String releaseDate;
	String trailer;
	String screenshot1;
	String screenshot2;
	String screenshot3;
	String screenshot4;
	String relevant_site1;
	String relevant_site2;

	int ranking;
	
	MultipartFile file1;
	MultipartFile file2;
	MultipartFile file3;
	MultipartFile file4;
	
	public GameDTO() {}
	public GameDTO(int ranking, int no, String name, String thumbnail ) {
		super();
		this.ranking = ranking;
		this.no = no;
		this.name = name;
		this.thumbnail = thumbnail;
	}
	public GameDTO(int no, String name, String explanation, String genre, String platform,
			String thumbnail, int views, double rating, String releaseDate, String trailer,
			String screenshot1, String screenshot2, String screenshot3, String screenshot4,
			String relevant_site1, String relevant_site2) {
		super();
		this.no = no;
		this.name = name;
		this.explanation = explanation;	
		this.platform = platform;
		this.thumbnail = thumbnail;
		this.views = views;
		this.rating = rating;
		this.releaseDate = releaseDate;
		this.trailer = trailer;
		this.screenshot1 = screenshot1;
		this.screenshot2 = screenshot2;
		this.screenshot3 = screenshot3;
		this.screenshot4 = screenshot4;
		this.relevant_site1 = relevant_site1;
		this.relevant_site2 = relevant_site2;
	}
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public String getPlatform() {
		return platform;
	}
	public void setPlatform(String platform) {
		this.platform = platform;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getTrailer() {
		return trailer;
	}
	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}
	public String getScreenshot1() {
		return screenshot1;
	}
	public void setScreenshot1(String screenshot1) {
		this.screenshot1 = screenshot1;
	}
	public String getScreenshot2() {
		return screenshot2;
	}
	public void setScreenshot2(String screenshot2) {
		this.screenshot2 = screenshot2;
	}
	public String getScreenshot3() {
		return screenshot3;
	}
	public void setScreenshot3(String screenshot3) {
		this.screenshot3 = screenshot3;
	}
	public String getScreenshot4() {
		return screenshot4;
	}
	public void setScreenshot4(String screenshot4) {
		this.screenshot4 = screenshot4;
	}
	public int getRanking() {
		return ranking;
	}
	public void setRanking(int ranking) {
		this.ranking = ranking;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}
	public MultipartFile getFile3() {
		return file3;
	}
	public void setFile3(MultipartFile file3) {
		this.file3 = file3;
	}
	public MultipartFile getFile4() {
		return file4;
	}
	public void setFile4(MultipartFile file4) {
		this.file4 = file4;
	}
	public String getRelevant_site1() {
		return relevant_site1;
	}
	public void setRelevant_site1(String relevant_site1) {
		this.relevant_site1 = relevant_site1;
	}
	public String getRelevant_site2() {
		return relevant_site2;
	}
	public void setRelevant_site2(String relevant_site2) {
		this.relevant_site2 = relevant_site2;
	}
	
}
