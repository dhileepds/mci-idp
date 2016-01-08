require 'wice_grid'
class LangsController < ApplicationController
	
  def show
  	# @val="Factory Name"
  	# @val1="Factory Website"
    if I18n.locale== :ar
    	if(params[:search])
    		    @vs = params[:search]
    		    @factory = initialize_grid(MmFactory,conditions:["(Factory_Name like ? OR Factory_ID like ? OR Factory_Website like ?) AND Language = ?","%#{@vs}%","%#{@vs}%","%#{@vs}%",'ar'],:per_page=>10)
    	else 
        if (params[:search] =='') 
    	   @factory = initialize_grid(MmFactory,conditions:["Language = ?",'ar'],:per_page=>10)
        else
          @factory = initialize_grid(MmFactory,conditions:["Language = ?",'ar'],:per_page=>10) 
        end
    	#@factory = initialize_grid(Factory.where(active:true))
    end
  else
    if(params[:search])
            @vs = params[:search]
            @factory = initialize_grid(MmFactory,conditions:["(Factory_Name like ? OR Factory_ID like ? OR Factory_Website like ?) AND Language = ?","%#{@vs}%","%#{@vs}%","%#{@vs}%",'en'],:per_page=>10)
      else 
        if (params[:search] =='') 
         @factory = initialize_grid(MmFactory,conditions:["Language = ?",'en'],:per_page=>10)
        else
          @factory = initialize_grid(MmFactory,conditions:["Language = ?",'en'],:per_page=>10) 
        end
      #@factory = initialize_grid(Factory.where(active:true))
    end
  	# @factory = initialize_grid(Factory,conditions:["property = ? or property = ?",@val,@val1],:per_page=>10)
  	# @factory = initialize_grid(Factory,conditions:["property= ?",@val1],:per_page=>10)
  end

  end

  def view
    #language =I18n.locale
    language ='ar'
  	    var = request.query_parameters
  	    @data=var['Factory_ID']
  	   # @data1="Factory_Name" language
       @name =Factory.select("Value").where("Factory_ID = ? AND Client_seq = ? AND language = ?", @data,'1',language)
  	    @fname =Factory.select("Value","property","Seq").where("Factory_ID = ? AND Client_seq = ? AND language = ?", @data,'1',language)
        @fweb =Factory.select("Value","property","Seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'2',language)
        @fpaddress =Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'3',language)
        @fcity =Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'4',language)
       @fdistrict =Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'5',language)
       @fpostal_Code =Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'6',language)
        @fphone =Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'31',language)
        @ftype =Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'30',language)
        @fmobile =Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'32',language)
        @fpob =Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'7',language)
        @fpob_city =Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'8',language)
        @fpob_pc =Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'9',language)
        @fstate =Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'10',language)
        @flicense =Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'11',language)
         @fgps=Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'23',language)
        @fblockno =Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'24',language)
      @fnoemp =Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'25',language)
      @frelation =Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'12',language)
       @frelation_title =Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'13',language)
     @frelation_email =Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'14',language)
      @ftp_name =Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'15',language)
       @ftp_title =Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'16',language)
     @ftp_email =Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'17',language)
     @fcs_type=Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'18',language)
     @fland_type=Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'19',language)
     @fsite_land=Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'20',language)
     @find_city=Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'21',language)
     @find_land=Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'22',language)
    @fmfg_isic=Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'26',language)
    @fmfg_capacity=Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'27',language)
     @fmfg_uom=Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'28',language)
      @fmfg_period=Factory.select("Value","property","Client_seq").where("Factory_ID = ? AND Client_seq = ? AND language = ? ", @data,'29',language)
       @fown_org=Factory.select("Value","property","Seq").where("Factory_ID = ? AND Seq = ? AND language = ?", @data,'33',language)




   	   # @faddress =Factory.select("Value").where("Factory_ID = ? and property='Physical_Address'", @data)
   	   # @fcity =Factory.select("Value").where("Factory_ID = ? and property='City' ", @data)
      #	@fdistrict =Factory.select("Value").where("Factory_ID = ? and property='District' ", @data)
      #	@fpostal_Code =Factory.select("Value").where("Factory_ID = ? and (property='Postal_Code' or property='POB' or property='POB_City' or property='POB_PC' or property='State_Province_Code') ", @data)

 	  #  array.assoc(@viewfpkid)
  	 	@test=@fname.to_sql
 # 	 	@rows=@fname.fetch(0)
  #	 	@rows1=@fname.fetch(1)
  #	    @faddress =Factory.select("Value").where("Factory_ID = ? and property ='Physical_Address' and property='City'", @data)

  end

  def update
   
     a = params[:value]
    b = params[:fseq]
     @data=params[:Factory_ID]
     c = a.zip(b)
# @data='4'
    # #@update=Factory.update_attributes(:Factory_Name=>@name, :date=>new_date)
    # #@update=Factory.select("Value","property","Client_seq","Factory_ID").where("Factory_ID = ? AND Client_seq = ? ", @data,'29')
    # @update=Factory.where('Client_seq = ? AND Factory_ID = ? ', @fseq,@data).update_all(Value: @name)

    # c.each do |cp, card|
    #   @update=Factory.where('Client_seq = ? AND Factory_ID = ? ', @fseq,@data).update_all(Value: @name)
    # end
   
    if @update
        redirect_to controller: 'langs',action: 'view',Factory_ID: @data ,arra: c
    else
        redirect_to action: 'view', Factory_ID: @data ,arra: c
    end
  end
  # def update
  #  redirect_to action: 'view', Factory_ID: '4'

  # end

end
