using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
namespace Work_01
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowImage();
            }
        }
        private void ShowImage()
        {
            DirectoryInfo dir = new DirectoryInfo(Server.MapPath("~/Images/"));
            this.Repeater1.DataSource = dir.GetFiles().Select(f => new { pic = f.Name }).ToList();
            this.DataBind();
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                if (FileUpload1.PostedFile.ContentLength > 2 * 1024 * 1024)
                {
                    this.Label1.Text = "File size exceeds 2 mb limit";
                    return;
                }
                string ext = Path.GetExtension(FileUpload1.PostedFile.FileName);
                if (ext == ".jpg" || ext == ".png" || ext == ".gif")
                {
                    string path = Server.MapPath("/Images/") + FileUpload1.PostedFile.FileName;
                    FileUpload1.PostedFile.SaveAs(path);
                    ShowImage();


                }
                else
                {
                    this.Label1.Text = "Only jpg, gif, png file only supported!!!";
                }
            }
        }
    }
}