package edu.kdt.gametrend.game;

import org.springframework.stereotype.Component;

@Component("gamedto")
public class GameDTO {
	int no;
	String name;
	String explanation;
	String platform = null;
	String thumbnail;
	int views = 0;
	double rating = 0;
	String releaseDate;
	String trailer;
	String screenshot1;
	String screenshot2;
	String screenshot3;
	String screenshot4 = null;
	
	String genre;
	
	public GameDTO() {}
	public GameDTO(int no, String name, String explanation, String genre, String platform, 
			String thumbnail, int views, double rating, String releaseDate, String trailer,
			String screenshot1, String screenshot2, String screenshot3, String screenshot4) {
		super();
		this.no = no;
		this.name = name;
		this.explanation = explanation;	
		this.genre = genre;
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
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
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

}
