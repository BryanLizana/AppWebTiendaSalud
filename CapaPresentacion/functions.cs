using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CapaPresentacion
{
    public class functions
    {
        public string msg(string mensaje, string type)
        {
            string msg;

            switch (type)
            {
                case "error":
                    msg = "<div class='alert'><span class='closebtn' onclick="+'"'+ "this.parentElement.style.display='none';" + '"' + ">&times;</span>" + mensaje + "</div>";
                    break;
                case "info":
                    msg = "<div class='info'><span class='closebtn' onclick=" + '"' + "this.parentElement.style.display='none';" + '"' + ">&times;</span>" + mensaje + "</div>";
                    break;
                case "success":
                    msg = "<div class='success'><span class='closebtn' onclick=" + '"' + "this.parentElement.style.display='none';" + '"' + ">&times;</span>" + mensaje + "</div>";
                    break;
                default:
                    msg = "<div class='success'><span class='closebtn' onclick=" + '"' + "this.parentElement.style.display='none';" + '"' + ">&times;</span>Operación Completada.</div>";
                    break;
            }

            return msg;
        }
            
    }
}