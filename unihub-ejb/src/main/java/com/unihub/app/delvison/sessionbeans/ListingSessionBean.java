//@author Delvison
//This sessionbean allows CRUD operations for individual listings.

package com.unihub.app;

import javax.ejb.*;
import javax.annotation.Resource;
import java.util.Date;
import java.util.ArrayList;
import javax.naming.*;
import javax.jws.WebMethod;
import javax.jws.WebService;

@Startup
@Singleton(mappedName="ListingSessionBean")
@WebService
public class ListingSessionBean implements ListingObjInterfaceRemote {

  public ArrayList<Stuff> stuffs;
  int id;

 @WebMethod
 public int addStuff(String user, String name, String price, String university,
  String location, String category, String description, Date now, String bid) {
    if (this.stuffs == null){
      stuffs = new ArrayList<Stuff>();
      this.id = 0;
    }
    id = id+1;
    Stuff a = new Stuff(id, user, name, price, university, location, category,
                         description, now, bid);
    stuffs.add(a);    
    return id;
  }
      
  @WebMethod    
  public Stuff getStuff(int passedId) {
    Stuff stuff = stuffs.get(0); 
    for (Stuff s: stuffs){
      if (s.id == passedId)
        stuff = s;
    }
    return stuff;
  }
  
  @WebMethod
  public ArrayList<Stuff> userSearch(String userSearched){
    ArrayList<Stuff> listingsByTheUser = new ArrayList<Stuff>();
    
    for (Stuff s: stuffs){
      if(s.user.equals(userSearched)){
        listingsByTheUser.add(s);
      }
    }
    return listingsByTheUser; 
  }
   
   public void updateContent(int id, String name, String price, String university, String location, String category, String description, String bid){
    Stuff s = this.getStuff(id);
    s.updateContent(name,price,university,location,category,description,bid);
  }
}
