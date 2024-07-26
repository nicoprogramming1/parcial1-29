using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace parcial1_9
{
    public partial class Show : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            fillGrid();

            if (File.Exists($"{Server.MapPath(".")}/archivo.txt"))
            {
                StreamReader streamReader = new StreamReader(Server.MapPath(".") + "/archivo.txt");
                string[] lines = (streamReader.ReadToEnd()).Split('\n');
                streamReader.Close();
                foreach (string line in lines)
                {
                    ListBoxReader.Text += $"{line.ToString()}";
                }
            }
            else
            {
                ListBoxReader.Text = "El archivo no existe";
            }

            HttpCookie cookie = Request.Cookies["cookieEmail"];
            string valorLabel = cookie != null ? cookie.Value : null;
            LabelCookie.Text = valorLabel;

            if (this.Session["sessionUsuario"] != null)
            {
                LabelSession.Text = Session["sessionUsuario"].ToString();
            }
        }

        public void fillGrid()
        {
            string path = $"{Server.MapPath(".")}/files";
            if (Directory.Exists(path))
            {
                string[] files = Directory.GetFiles(path);
                List<Archivo> fileList = new List<Archivo>();
                foreach (string file in files)
                {
                    var fileNew = new Archivo(Path.GetFileName(file), file);
                    fileList.Add(fileNew);
                }
                GridView1.DataSource = fileList;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Descargar")
            {
                GridViewRow registro = GridView1.Rows[Convert.ToInt32(e.CommandArgument)];
                string filePath = registro.Cells[2].Text;

                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                Response.TransmitFile(filePath);
                Response.End();
                LabelResult.Text = "File downloaded";
            }
        }
    }
}