using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Work_01
{
    public partial class Ex_02_ImageUploadToDB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            FileUpload fu = DetailsView1.FindControl("FileUpload1") as FileUpload;
            if (fu.HasFile)
            {
                //string fileName = Guid.NewGuid() + Path.GetExtension(fu.FileName);
                //fu.SaveAs(Server.MapPath("~/Images/") + fileName);
                e.Values["picture"] = fu.FileBytes;
            }
        }
    }
}