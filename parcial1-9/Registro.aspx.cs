using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace parcial1_9
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            string path = $"{Server.MapPath(".")}/files";
            string result = string.Empty;

            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            if (File.Exists($"{path}/{FileUpload1.FileName}"))
            {
                result += $"El archivo {FileUpload1.FileName} ya existe - ";
            }
            else
            {
                FileUpload1.SaveAs($"{path}/{FileUpload1.FileName}");
                result += $"El archivo fue agregado - </br>";
            }

            foreach (HttpPostedFile archivo in FileUpload2.PostedFiles)
            {
                if (File.Exists($"{path}/{archivo.FileName}"))
                {
                    result += $"El archivo {archivo.FileName} ya existe - ";
                }
                else
                {
                    FileUpload2.SaveAs($"{path}/{archivo.FileName}");
                    result += $"El archivo {archivo.FileName} fue agregado - </br>";
                }
            }

            HttpCookie cookie1 = new HttpCookie("cookieEmail", TextBoxEmail.Text);
            Response.Cookies.Add(cookie1);
            cookie1.Expires = DateTime.Now.AddMinutes(12);

            this.Session["sessionUsuario"] = TextBoxUsuario.Text;

            StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/archivo.txt", true);
            streamWriter.WriteLine(TextBoxEdad.Text);
            streamWriter.WriteLine(TextBoxEmail.Text);
            streamWriter.Close();
            LabelResult.Text = $"{result} StreamReader agregado, ruta de archivo.txt {Server.MapPath(".")} .";
        }
    }
}