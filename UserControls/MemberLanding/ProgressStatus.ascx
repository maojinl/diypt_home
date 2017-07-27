<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProgressStatus.ascx.cs" Inherits="UserControls_MemberLanding_ProgressStatus" %>
         <script type="text/javascript" src="https://www.google.com/jsapi?autoload={
        'modules':[{
          'name':'visualization',
          'version':'1',
          'packages':['corechart']
        }]
      }"></script>

                 

<div class="tab-inner-content">
    <h2 class="progress-title text-center">Progress Results Week <span><asp:Label ID="lblWeekNum" runat="server"></asp:Label></span></h2>
    <!-- PROGRESS INTRO -->
    <div class="row row-chart-intro">
        <div class="col-sm-12">
            <p>Nequmet, consectetur, adipisci velit. Neque porro quisquam est qui dolorem ipsum quia dolor sit. Nequmet, consectetur, adipisci velit. Neque porro quisquam est qui dolorem ipsum quia dolor sit.</p>
<p>
Take it first thing in the morning while seated, not standing. Place your index and middle finger on either your carotid artery (neck) or your radial artery (inside of your wrist) and count the number of beats you feel in 60 seconds. 
</p>
        </div>
    </div>
    <!-- PROGRESS INTRO -->
    <!-- PROGRESS INPUT -->
    <form action="#" class="mb-4">
        <div class="row">
            <div class="col col-progress-form">
                <div class="form-group">
                    <label>Current weight (kg)</label>
                    <asp:TextBox ID="txtWeight" class="form-control" placeholder="0" type="text" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col col-progress-form">
                <div class="form-group">
                    <label>Current waist (cm)</label>
                    <asp:TextBox ID="txtWaist" class="form-control" placeholder="0" type="text" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col col-progress-form">
                <div class="form-group">
                    <label>Hip</label>
                    <asp:TextBox ID="txtHip" class="form-control" placeholder="0" type="text" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col col-progress-form">
                <div class="form-group">
                    <label>Current chest (cm)</label>
                    <asp:TextBox ID="txtChest" class="form-control" placeholder="0" type="text" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col col-progress-form">
                <div class="form-group">
                    <label>Current heart rate </label>
                    <asp:TextBox ID="txtHeartRate" class="form-control" placeholder="0" type="text" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col text-center">
                 <div>
                     <asp:Button ID="btnUpdateProgress" class="btn btn-p mb-5 sec" runat="server" Text="SHOW MY PROGRESS RESULTS" 
                                onclick="btnUpdateProgress_Click" />
                 </div>
            </div>
        </div>
    </form>
    <!-- end PROGRESS INPUT -->
    <!--  PROGRESS CHART -->
    <div class="row row-chart">
        <div class="col">
            <div class="group-chart text-xs-center">
                <div class="chart-easurement">Weight</div>
                <div class="chart-unit hidden-sm-down">(kilogram/kg)</div>
                <div class="chart-result chart-result-sp"><asp:Label ID="lblWeight" runat="server" Text=" "></asp:Label></div>
                <div class="chart-result-different"><asp:Label ID="lblWeightDiff" runat="server" Text=" "></asp:Label></div>
                &nbsp;<span class="hidden-sm-down"><asp:Button ID="btnDrawWeight" class="btn active btn-sm btn-default btn-primary btn-block sec" runat="server" Text="SEE ON GRAPH" OnClick="btnDrawWeight_Click" /></span>
            </div>
        </div>
        <div class="col">
            <div class="group-chart text-xs-center">
                <div class="chart-easurement">Waist</div>
                <div class="chart-unit hidden-sm-down">(centimeter/cm)</div>
                <div class="chart-result chart-result-sp"><asp:Label ID="lblWaist" runat="server" Text=" "></asp:Label></div>
                <div class="chart-result-different"><asp:Label ID="lblWaistDiff" runat="server" Text=" "></asp:Label></div>
                &nbsp;<span class="hidden-sm-down"><asp:Button ID="btnDrawWaist" class="btn active btn-sm btn-default btn-primary btn-block sec" runat="server" Text="SEE ON GRAPH" OnClick="btnDrawWeight_Click" /></span>
            </div>
        </div>
        <div class="col">
            <div class="group-chart text-xs-center">
                <div class="chart-easurement">Hip</div>
                <div class="chart-unit hidden-sm-down">(centimeter/cm)</div>
                <div class="chart-result chart-result-sp"><asp:Label ID="lblHip" runat="server" Text=" "></asp:Label></div>
                <div class="chart-result-different"><asp:Label ID="lblHipDiff" runat="server" Text=" "></asp:Label></div>
                &nbsp;<span class="hidden-sm-down"><asp:Button ID="btnDrawHip" class="btn active btn-sm btn-default btn-primary btn-block sec" runat="server" Text="SEE ON GRAPH" OnClick="btnDrawWeight_Click" /></span>
            </div>
        </div>
        <div class="col">
            <div class="group-chart text-xs-center">
                <div class="chart-easurement">Chest</div>
                <div class="chart-unit hidden-sm-down">(centimeter/cm)</div>
                <div class="chart-result chart-result-sp"><asp:Label ID="lblChest" runat="server" Text=" "></asp:Label></div>
                <div class="chart-result-different"><asp:Label ID="lblChestDiff" runat="server" Text=" "></asp:Label></div>
                &nbsp;<span class="hidden-sm-down"><asp:Button ID="btnDrawChest" class="btn active btn-sm btn-default btn-primary btn-block sec" runat="server" Text="SEE ON GRAPH" OnClick="btnDrawWeight_Click" /></span>
            </div>
        </div>
        <div class="col">
            <div class="group-chart text-xs-center">
                <div class="chart-easurement chart-easurement-s">Heart Rate</div>
                <div class="chart-unit hidden-sm-down">(times/minute)</div>
                <div class="chart-result chart-result-sp"><asp:Label ID="lblHeartRate" runat="server" Text=" "></asp:Label></div>
                <div class="chart-result-different"><asp:Label ID="lblHeartRateDiff" runat="server" Text=" "></asp:Label></div>
                &nbsp;<span class="hidden-sm-down"><asp:Button ID="btnDrawHeartRate" class="btn active btn-sm btn-default btn-primary btn-block sec" runat="server" Text="SEE ON GRAPH" OnClick="btnDrawWeight_Click" /></span>
            </div>
        </div>
    </div>
    <div class="row row-chart-svg">
        <div class="col">
            <div id="curve_chart" style="width: 900px; height: 500px">
            </div>
        </div>
    </div>
    <!-- end PROGRESS CHART -->
    <hr>
    <!--  PROGRESS PHOTOS -->
    <h2 class="progress-title text-center">Progress Photos <span>Week <asp:Label ID="lblWeekNum2" runat="server"></asp:Label></span></h2>

    <div runat="server" id="divProgressPhotoWeek1" class="d-flex row mb-4">
        <div class="align-self-sm-center flex-column col-md-3">
            <h3 class="c_p">WEEK 1</h3>
            <p>adipisci velit. Neque porro quisquam est qui dolorem ipsum quia dolor sit. Nequmet, c</p>
            
        </div>
        <div class="p-1 col-md-3"><asp:Image ID="Image11" runat="server" class="img-fluid" ImageUrl="/images/front-upload.png"  /></div>
        <div class="p-1 col-md-3"><asp:Image ID="Image12" runat="server" class="img-fluid" ImageUrl="/images/side-upload.png"   /></div>
        <div class="p-1 col-md-3"><asp:Image ID="Image13" runat="server" class="img-fluid" ImageUrl="/images/back-upload.png"   /></div>
    </div>

    <div runat="server" id="divProgressPhotoWeek5" class="d-flex row mb-4">
        <div class="align-self-sm-center flex-column  col-md-3">
            <h3 class="c_p">WEEK 5</h3>
            <p>adipisci velit. Neque porro quisquam est qui dolorem ipsum quia dolor sit. Nequmet, c</p>
            
        </div>
        <div class="p-1 col-md-3"><asp:Image ID="Image51" runat="server" class="img-fluid" ImageUrl="/images/front-upload.png"  /></div>
        <div class="p-1 col-md-3"><asp:Image ID="Image52" runat="server" class="img-fluid" ImageUrl="/images/side-upload.png"   /></div>
        <div class="p-1 col-md-3"><asp:Image ID="Image53" runat="server" class="img-fluid" ImageUrl="/images/back-upload.png"   /></div>
    </div>

    <div runat="server" id="divProgressPhotoWeek8" class="d-flex row mb-4">
        <div class="align-self-sm-center flex-column  col-md-3">
            <h3 class="c_p">WEEK 8</h3>
            <p>adipisci velit. Neque porro quisquam est qui dolorem ipsum quia dolor sit. Nequmet, c</p>
            
        </div>
        <div class="p-1 col-md-3"><asp:Image ID="Image81" runat="server" class="img-fluid" ImageUrl="/images/front-upload.png"  /></div>
        <div class="p-1 col-md-3"><asp:Image ID="Image82" runat="server" class="img-fluid" ImageUrl="/images/side-upload.png"   /></div>
        <div class="p-1 col-md-3"><asp:Image ID="Image83" runat="server" class="img-fluid" ImageUrl="/images/back-upload.png"   /></div>
    </div>

    <div runat="server" id="divProgressPhotoWeek11" class="d-flex row mb-4">
        <div class="align-self-sm-center flex-column  col-md-3">
            <h3 class="c_p">WEEK 11</h3>
            <p>adipisci velit. Neque porro quisquam est qui dolorem ipsum quia dolor sit. Nequmet, c</p>
            
        </div>
        <div class="p-1 col-md-3"><asp:Image ID="Image111" runat="server" class="img-fluid" ImageUrl="/images/front-upload.png"  /></div>
        <div class="p-1 col-md-3"><asp:Image ID="Image112" runat="server" class="img-fluid" ImageUrl="/images/side-upload.png"   /></div>
        <div class="p-1 col-md-3"><asp:Image ID="Image113" runat="server" class="img-fluid" ImageUrl="/images/back-upload.png"   /></div>
    </div>

    <div runat="server" id="photoPanelUpload" class="d-flex row mb-4">
        <div class="align-self-sm-center flex-column  col-md-3">
            <h3 class="c_p">WEEK <asp:Label ID="lblWeekNum3" runat="server"></asp:Label></h3>
            <p>adipisci velit. Neque porro quisquam est qui dolorem ipsum quia dolor sit. Nequmet, c</p>
            
        </div>
        <div class="p-1 col-md-3"><asp:Image ID="Image1" runat="server" class="img-fluid" ImageUrl="/images/front-upload.png"  /></div>
        <div class="p-1 col-md-3"><asp:Image ID="Image2" runat="server" class="img-fluid" ImageUrl="/images/side-upload.png"   /></div>
        <div class="p-1 col-md-3"><asp:Image ID="Image3" runat="server" class="img-fluid" ImageUrl="/images/back-upload.png"   /></div>
    </div>
    <!--  end PROGRESS PHOTOS -->
    
<asp:FileUpload ID="frontUpload" runat="server" style="display: none;" />
<asp:FileUpload ID="sideUpload" runat="server" style="display: none;" />
<asp:FileUpload ID="backUpload" runat="server" style="display: none;" />
    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click"  style="display: none;" />
</div>
<script>
    $('#<%= Image1.ClientID %>').click(function () {
        document.getElementById('<%= frontUpload.ClientID %>').click();
    });
    $('#<%= Image2.ClientID %>').click(function () {
        document.getElementById('<%= sideUpload.ClientID %>').click();
    });
    $('#<%= Image3.ClientID %>').click(function () {
        document.getElementById('<%= backUpload.ClientID %>').click();
    });

    function UploadFile(fileUpload)
    {
        if(fileUpload.value != "")
        {
            document.getElementById("<%= btnUpload.ClientID %>").click();
        }
    }
    
</script>