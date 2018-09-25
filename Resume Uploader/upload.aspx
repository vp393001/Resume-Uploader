<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upload.aspx.cs" Inherits="Resume_Uploader.upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


    <script type="text/javascript">

    var validFilesTypes=["pdf"];

    function ValidateFile()

    {

      var file = document.getElementById("<%=FileUpload1.ClientID%>");

      var label = document.getElementById("<%=Label1.ClientID%>");

      var path = file.value;

      var ext=path.substring(path.lastIndexOf(".")+1,path.length).toLowerCase();

      var isValidFile = false;

      for (var i=0; i<validFilesTypes.length; i++)

      {

        if (ext==validFilesTypes[i])

        {

            isValidFile=true;

            break;

        }

      }

      if (!isValidFile)

      {

        label.style.color="red";

        label.innerHTML="Invalid File. Please upload a File with" +

         " extension:\n\n"+validFilesTypes.join(", ");

      }

      return isValidFile;

     }

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
           <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Resume Uploader</h1><br />
            <br />
            <br />
        </div>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        &nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" ForeColor="#FF3300" Text="File Format: Resume_FirstName_LastName.pdf"></asp:Label>
        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <br />
        <p>
            <asp:Button ID="Button1" runat="server"  OnClientClick = "return ValidateFile()" OnClick="Button1_Click" Text="Upload" />
        </p>
    </form>
</body>
</html>
