using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Resume_Uploader
{
    public partial class upload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    if (FileUpload1.PostedFile.ContentType == "application/pdf")
                    {
                        if (FileUpload1.PostedFile.ContentLength < 625000)
                        {
                            string filename = Path.GetFileName(FileUpload1.FileName);
                            
                            string[] filesplit = filename.Split('_');
                            String temp = filesplit[1];
                            String FirstChar = temp[0].ToString();
                            
                            string path = @"~\App_Data\Resume\" + FirstChar + "\\";

                            if (!(Directory.Exists(path)))
                                Directory.CreateDirectory(Server.MapPath(path));

                            FileUpload1.SaveAs(Server.MapPath(path) + filename);
                            Label1.Text = "Upload status: File uploaded!";
                        }
                        else
                            Label1.Text = "Upload status: The file has to be less than 5 mb!";
                    }
                    else
                        Label1.Text = "Upload status: Only pdf files are accepted!";
                }
                catch (Exception ex)
                {
                    Label1.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
        }
    }
}