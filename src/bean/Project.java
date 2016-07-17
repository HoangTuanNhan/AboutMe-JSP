package bean;

public class Project {
private int idProject;
private String name;
private String nguoithuchien;
private String preview_text;
private String picture;
private String link;

public int getIdProject() {
	return idProject;
}
public void setIdProject(int idProject) {
	this.idProject = idProject;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getNguoiThucHien() {
	return nguoithuchien;
}
public void setNguoiThucHien(String nguoithuchien) {
	this.nguoithuchien = nguoithuchien;
}
public String getPreview_text() {
	return preview_text;
}
public void setPreview_text(String preview_text) {
	this.preview_text = preview_text;
}
public String getPicture() {
	return picture;
}
public void setPicture(String picture) {
	this.picture = picture;
}
public String getLink() {
	return link;
}
public void setLink(String link) {
	this.link = link;
}
public Project(int idProject, String name,String nguoithuchien, String preview_text, String picture,
		String link) {
	super();
	this.idProject = idProject;
	this.name = name;
	this.nguoithuchien=nguoithuchien;
	this.preview_text = preview_text;
	this.picture = picture;
	this.link = link;
	
}
public Project() {
	super();
	// TODO Auto-generated constructor stub
}

}
