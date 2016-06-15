using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;
using System.Data.SqlClient;

namespace _3Glist
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public override void VerifyRenderingInServerForm(Control control) { } 

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            Response.Clear(); 
            Response.AppendHeader("Content-Disposition", "attachment;filename=FileName.xls");
            //设置输出流为简体中文    
            Response.Charset = "GB2312";
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
            //设置输出文件类型为excel文件。    
            Response.ContentType = "application/ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            GridView1.RenderControl(htw);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                string ConStr = ConfigurationManager.ConnectionStrings["3glist"].ConnectionString;
                SqlConnection conn = new SqlConnection(ConStr);
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "update t_ply_base set c_status = '1' where c_ply_no = @c_ply_no";
                cmd.Parameters.Add("@c_ply_no", SqlDbType.NVarChar, 30);
                cmd.Parameters["@c_ply_no"].Value = GridView1.Rows[i].Cells[0].Text ;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                
            }
            Response.Write("<script>alert('更新成功！');</script>");
        }
    }
    
}
