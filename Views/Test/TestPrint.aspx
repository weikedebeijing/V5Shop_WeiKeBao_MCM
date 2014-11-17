<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--<script type="text/javascript">

        function web_print() {
            if (navigator.appName == "Microsoft Internet Explorer") {
                var PrintCommand = '<object ID="PrintCommandObject" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></object>';
                document.body.insertAdjacentHTML('beforeEnd', PrintCommand);
                PrintCommandObject.ExecWB(6, -1); PrintCommandObject.outerHTML = "";
            }
            else {
                window.print();
            }
        }

    </script>--%>
    <h2>
        TestPrint</h2>
    <script language="VBScript">
        sub Print()
            OLECMDID_PRINT = 6
            OLECMDEXECOPT_DONTPROMPTUSER = 2
            OLECMDEXECOPT_PROMPTUSER = 1
            call WB.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_DONTPROMPTUSER,1)
        End Sub
        document.write "<object id='WB' width='0' height='0' classid='CLSID:8856F961-340A-11D0-A96B-00C04FD705A2'></object>"
    </script>
    <%--<object id="WebBrowser1" width="0" height="0" classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2">--%>
    </object>
    <a href="#" onclick="Print()">Click Here to Print</a>
    <input type="button" value="Print Page" onclick="printPage()" />
    <%--<script type="text/javascript">
        var PrintCommandObject = null;

        function printPage() {
            if (PrintCommandObject) {
                try {
                    PrintCommandObject.ExecWB(6, 2);
                    PrintCommandObject.outerHTML = "";
                }
                catch (e) {
                    window.print();
                }
            }
            else {
                window.print();
            }
        }

        window.onload = function () {
            if (navigator.appName == "Microsoft Internet Explorer") {
                // attach and initialize print command ActiveX object
                try {
                    var PrintCommand = '<object id="PrintCommandObject" classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" width="0" height="0"></object>';
                    document.body.insertAdjacentHTML('beforeEnd', PrintCommand);
                }
                catch (e) { }
            }

            setTimeout(printPage, 1);
        };

    </script>--%>
    <%--<script language="VBScript">
// THIS VB SCRIP REMOVES THE PRINT DIALOG BOX AND PRINTS TO YOUR DEFAULT PRINTER
Sub window_onunload()
On Error Resume Next
Set WB = nothing
On Error Goto 0
End Sub

Sub Print()
OLECMDID_PRINT = 6
OLECMDEXECOPT_DONTPROMPTUSER = 2
OLECMDEXECOPT_PROMPTUSER = 1


On Error Resume Next

If DA Then
call WB.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_DONTPROMPTUSER,1)

Else
call WB.IOleCommandTarget.Exec(OLECMDID_PRINT ,OLECMDEXECOPT_DONTPROMPTUSER,"","","")

End If

If Err.Number <> 0 Then
If DA Then 
Alert("Nothing Printed :" & err.number & " : " & err.description)
Else
HandleError()
End if
End If
On Error Goto 0
End Sub

If DA Then
wbvers="8856F961-340A-11D0-A96B-00C04FD705A2"
Else
wbvers="EAB22AC3-30C1-11CF-A7EB-0000C05BAE0B"
End If

document.write "<object ID=""WB"" WIDTH=0 HEIGHT=0 CLASSID=""CLSID:"
document.write wbvers & """> </object>"
</script>--%>
    <%--<script language='VBScript'>
Sub Print()
   OLECMDID_PRINT = 6
   OLECMDEXECOPT_DONTPROMPTUSER = 2
   OLECMDEXECOPT_PROMPTUSER = 1
   call WB.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_DONTPROMPTUSER,1)
End Sub
document.write "<object ID='WB' WIDTH=0 HEIGHT=0 CLASSID='CLSID:8856F961-340A-11D0-A96B-00C04FD705A2'></object>"
</script>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>
