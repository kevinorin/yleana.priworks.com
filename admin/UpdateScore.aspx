<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UpdateScore.aspx.cs" Inherits="YleanaAdmin.UpdateScore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        window.onload = function () {
            $('#<%=lblOneTotal.ClientID %>').text(parseFloat("0" + $('#<%=txtoneCR.ClientID %>').val()) + parseFloat("0" + $('#<%=txtoneM.ClientID %>').val()) + parseFloat("0" + $('#<%=txtoneWR.ClientID %>').val()));
            $('#<%=lblTwoTotal.ClientID %>').text(parseFloat("0" + $('#<%=txtTwoCR.ClientID %>').val()) + parseFloat("0" + $('#<%=txtTwoM.ClientID %>').val()) + parseFloat("0" + $('#<%=txtTwoWR.ClientID %>').val()));
            $('#<%=lblThreeTotal.ClientID %>').text(parseFloat("0" + $('#<%=txtThreeCR.ClientID %>').val()) + parseFloat("0" + $('#<%=txtThreeM.ClientID %>').val()) + parseFloat("0" + $('#<%=txtThreeWR.ClientID %>').val()));
            $('#<%=lblFourTotal.ClientID %>').text(parseFloat("0" + $('#<%=txtFourCR.ClientID %>').val()) + parseFloat("0" + $('#<%=txtFourM.ClientID %>').val()) + parseFloat("0" + $('#<%=txtFourWR.ClientID %>').val()));
            $('#<%=lblFiveTotal.ClientID %>').text(parseFloat("0" + $('#<%=txtFiveCR.ClientID %>').val()) + parseFloat("0" + $('#<%=txtFiveM.ClientID %>').val()) + parseFloat("0" + $('#<%=txtFiveWR.ClientID %>').val()));
            $('#<%=lblSixTotal.ClientID %>').text(parseFloat("0" + $('#<%=txtSixCR.ClientID %>').val()) + parseFloat("0" + $('#<%=txtSixM.ClientID %>').val()) + parseFloat("0" + $('#<%=txtSixWR.ClientID %>').val()));
            $('#<%=lblSevenTotal.ClientID %>').text(parseFloat("0" + $('#<%=txtSevenCR.ClientID %>').val()) + parseFloat("0" + $('#<%=txtSevenM.ClientID %>').val()) + parseFloat("0" + $('#<%=txtSevenWR.ClientID %>').val()));
        };

        $(document).ready(function () {
            $('input[type=text]').change(function () {
                //alert(parseFloat("0" + $('#<%=txtTwoCR.ClientID %>').val()) + parseFloat("0" + $('#<%=txtTwoM.ClientID %>').val()) + parseFloat("0" + $('#<%=txtTwoWR.ClientID %>').val()));
                $('#<%=lblOneTotal.ClientID %>').text(parseFloat("0" + $('#<%=txtoneCR.ClientID %>').val()) + parseFloat("0" + $('#<%=txtoneM.ClientID %>').val()) + parseFloat("0" + $('#<%=txtoneWR.ClientID %>').val()));
                $('#<%=lblTwoTotal.ClientID %>').text(parseFloat("0" + $('#<%=txtTwoCR.ClientID %>').val()) + parseFloat("0" + $('#<%=txtTwoM.ClientID %>').val()) + parseFloat("0" + $('#<%=txtTwoWR.ClientID %>').val()));
                $('#<%=lblThreeTotal.ClientID %>').text(parseFloat("0" + $('#<%=txtThreeCR.ClientID %>').val()) + parseFloat("0" + $('#<%=txtThreeM.ClientID %>').val()) + parseFloat("0" + $('#<%=txtThreeWR.ClientID %>').val()));
                $('#<%=lblFourTotal.ClientID %>').text(parseFloat("0" + $('#<%=txtFourCR.ClientID %>').val()) + parseFloat("0" + $('#<%=txtFourM.ClientID %>').val()) + parseFloat("0" + $('#<%=txtFourWR.ClientID %>').val()));
                $('#<%=lblFiveTotal.ClientID %>').text(parseFloat("0" + $('#<%=txtFiveCR.ClientID %>').val()) + parseFloat("0" + $('#<%=txtFiveM.ClientID %>').val()) + parseFloat("0" + $('#<%=txtFiveWR.ClientID %>').val()));
                $('#<%=lblSixTotal.ClientID %>').text(parseFloat("0" + $('#<%=txtSixCR.ClientID %>').val()) + parseFloat("0" + $('#<%=txtSixM.ClientID %>').val()) + parseFloat("0" + $('#<%=txtSixWR.ClientID %>').val()));
                $('#<%=lblSevenTotal.ClientID %>').text(parseFloat("0" + $('#<%=txtSevenCR.ClientID %>').val()) + parseFloat("0" + $('#<%=txtSevenM.ClientID %>').val()) + parseFloat("0" + $('#<%=txtSevenWR.ClientID %>').val()));
            });
        });

        $(document).ready(function () {
            $('input[type=text]').keydown(function (event) {
                    // Allow: Ctrl+A,   // Allow: home, end, left, right
                    if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 || (event.keyCode == 65 && event.ctrlKey === true) || (event.keyCode >= 35 && event.keyCode <= 39)) {
                        return;
                    } else {
                        // Ensure that it is a number and stop the keypress
                        if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                            event.preventDefault();
                        }
                    }
                });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Add/Edit SAT Scores</h1>
<asp:Panel ID="pnl1" runat="server">
    <asp:Label ID="lblName" runat="server"></asp:Label>    
    <br />
    <asp:Label ID="lblEmail" runat="server"></asp:Label>
	<br />
    <br />
    <asp:Label ID="lblOne" runat="server" Text="Test One" Width="100"></asp:Label>&nbsp;&nbsp;
    <asp:Label ID="lblOneCR" runat="server" Text="CR" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtoneCR" MaxLength="3" runat="server" Width="100"></telerik:RadTextBox>&nbsp;
    <asp:Label ID="lblOneM" runat="server" Text="M" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtoneM" MaxLength="3" runat="server" Width="100"></telerik:RadTextBox>&nbsp;
    <asp:Label ID="lblOneWR" runat="server" Text="WR" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtoneWR" MaxLength="3" runat="server" Width="100"></telerik:RadTextBox>&nbsp;
    <asp:Label ID="lblOneE" runat="server" Text="E" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtoneE" MaxLength="1" runat="server" Width="100"></telerik:RadTextBox>  &nbsp;
    <asp:Label ID="lblOneTotal" runat="server" Width="50" Text=""></asp:Label>  &nbsp;
    <br />
    <asp:Label ID="lblTwo" runat="server" Text="Test Two " Width="100"></asp:Label>&nbsp;&nbsp;
    <asp:Label ID="lblTwoCR" runat="server" Text="CR" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtTwoCR" MaxLength="3" runat="server" Width="100"></telerik:RadTextBox>&nbsp;
    <asp:Label ID="lblTwoM" runat="server" Text="M" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtTwoM" MaxLength="3" runat="server" Width="100"></telerik:RadTextBox>&nbsp;
    <asp:Label ID="lblTwoWR" runat="server" Text="WR" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtTwoWR" MaxLength="3" runat="server" Width="100"></telerik:RadTextBox>&nbsp;
    <asp:Label ID="lblTwoE" runat="server" Text="E" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtTwoE" MaxLength="1" runat="server" Width="100"></telerik:RadTextBox>  &nbsp;
    <asp:Label ID="lblTwoTotal" runat="server" Text="" Width="50"></asp:Label>  &nbsp;
    <br />
    <asp:Label ID="lblThree" runat="server" Text="Test Three " Width="100"></asp:Label>&nbsp;&nbsp;
    <asp:Label ID="lblThreeCR" runat="server" Text="CR" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtThreeCR" MaxLength="3" runat="server" Width="100"></telerik:RadTextBox>&nbsp;
    <asp:Label ID="lblThreeM" runat="server" Text="M" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtThreeM" MaxLength="3" runat="server" Width="100"></telerik:RadTextBox>&nbsp;
    <asp:Label ID="lblThreeWR" runat="server" Text="WR" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtThreeWR" MaxLength="3" runat="server" Width="100"></telerik:RadTextBox>&nbsp;
    <asp:Label ID="lblThreeE" runat="server" Text="E" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtThreeE" MaxLength="1" runat="server" Width="100"></telerik:RadTextBox>  &nbsp;
    <asp:Label ID="lblThreeTotal" runat="server" Text="" Width="50"></asp:Label>  &nbsp;
    <br />
    <asp:Label ID="lblFour" runat="server" Text="Test Four " Width="100"></asp:Label>&nbsp;&nbsp;
    <asp:Label ID="lblFourCR" runat="server" Text="CR" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtFourCR" MaxLength="3" runat="server" Width="100"></telerik:RadTextBox>&nbsp;
    <asp:Label ID="lblFourM" runat="server" Text="M" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtFourM" MaxLength="3" runat="server" Width="100"></telerik:RadTextBox>&nbsp;
    <asp:Label ID="lblFourWR" runat="server" Text="WR" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtFourWR" MaxLength="3" runat="server" Width="100"></telerik:RadTextBox>&nbsp;
    <asp:Label ID="lblFourE" runat="server" Text="E" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtFourE" MaxLength="1" runat="server" Width="100"></telerik:RadTextBox>  &nbsp;
    <asp:Label ID="lblFourTotal" runat="server" Text="" Width="50"></asp:Label>  &nbsp;
     <br />
    <asp:Label ID="lblFive" runat="server" Text="Test FIve " Width="100"></asp:Label>&nbsp;&nbsp;
    <asp:Label ID="lblFiveCR" runat="server" Text="CR" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtFiveCR" MaxLength="3" runat="server" Width="100"></telerik:RadTextBox>&nbsp;
    <asp:Label ID="lblFiveM" runat="server" Text="M" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtFiveM" MaxLength="3" runat="server" Width="100"></telerik:RadTextBox>&nbsp;
    <asp:Label ID="lblFiveWR" runat="server" Text="WR" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtFiveWR" MaxLength="3" runat="server" Width="100"></telerik:RadTextBox>&nbsp;
    <asp:Label ID="lblFiveE" runat="server" Text="E" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtFiveE" MaxLength="1" runat="server" Width="100"></telerik:RadTextBox>  &nbsp;
    <asp:Label ID="lblFiveTotal" runat="server" Text="" Width="50"></asp:Label>  &nbsp;
     <br />
    <asp:Label ID="lblSix" runat="server" Text="Test Six " Width="100"></asp:Label>&nbsp;&nbsp;
    <asp:Label ID="lblSixCR" runat="server" Text="CR" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtSixCR" MaxLength="3" runat="server" Width="100"></telerik:RadTextBox>&nbsp;
    <asp:Label ID="lblSixM" runat="server" Text="M" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtSixM" MaxLength="3" runat="server" Width="100"></telerik:RadTextBox>&nbsp;
    <asp:Label ID="lblSixWR" runat="server" Text="WR" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtSixWR" MaxLength="3" runat="server" Width="100"></telerik:RadTextBox>&nbsp;
    <asp:Label ID="lblSixE" runat="server" Text="E" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtSixE" MaxLength="1" runat="server" Width="100"></telerik:RadTextBox>  &nbsp;
    <asp:Label ID="lblSixTotal" runat="server" Text="" Width="50"></asp:Label>  &nbsp;
     <br />
    <asp:Label ID="lblSeven" runat="server" Text="Test Seven " Width="100"></asp:Label>&nbsp;&nbsp;
    <asp:Label ID="lblSevenCR" runat="server" Text="CR" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtSevenCR" MaxLength="3" runat="server" Width="100"></telerik:RadTextBox>&nbsp;
    <asp:Label ID="lblSevenM" runat="server" Text="M" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtSevenM" MaxLength="3" runat="server" Width="100"></telerik:RadTextBox>&nbsp;
    <asp:Label ID="lblSevenWR" runat="server" Text="WR" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtSevenWR" MaxLength="3" runat="server" Width="100"></telerik:RadTextBox>&nbsp;
    <asp:Label ID="lblSevenE" runat="server" Text="E" Width="50"></asp:Label>&nbsp;
    <telerik:RadTextBox ID="txtSevenE" MaxLength="1" runat="server" Width="100"></telerik:RadTextBox>  &nbsp;
    <asp:Label ID="lblSevenTotal" runat="server" Text="" Width="50"></asp:Label>  &nbsp;
</asp:Panel>
    <br />
	<br />
	<telerik:RadButton ID="btnAddScore" ButtonType="StandardButton" runat="server" Text="Update Score" OnClick="btnAddScore_Click"></telerik:RadButton>
	<br />
	<br />
	<asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
	<br />
	<br /> 
</asp:Content>
