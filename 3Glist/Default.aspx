<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_3Glist._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>一等奖</title>
    <style type="text/css">
        .style1 {
            text-align: left;
        }
        #form1 {
            height: 745px;
        }
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            font-size: xx-large;
            color: #FF9900;
        }
    </style>
</head>
<body background='background1.jpg' style="background-repeat: round">
    <form id="form1" runat="server">
    <div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:3glist %>" 
      ProviderName="<%$ ConnectionStrings:3glist.ProviderName %>" 
      SelectCommand="SELECT c_kind_no,c_category_no FROM t_prd_prod where c_kind_no = '03'" 
      DataSourceMode="DataReader">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:3glist %>" 
      SelectCommand="SELECT Top 15 * FROM t_ply_base Where c_status = 0 order by NEWID()">
    </asp:SqlDataSource>
        &nbsp;&nbsp;
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
            <table style="width:100%; margin-top: 0px;">
                <tr>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Main.aspx" 
                style="text-align: left">返回主页</asp:HyperLink>
                    </td>
                    <td style="text-align: right">
                        险种列表：<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="c_category_no" DataValueField="c_kind_no"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="2">
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="导出获奖清单" style="height: 21px" Visible="False" />
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="更新清单" style="height: 21px" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center" colspan="2" class="auto-style2">
                        获奖保单号</td>
                </tr>
                <tr>
                    <td style="text-align: center" colspan="2">
                        <asp:DataList ID="DataList1" runat="server" CellSpacing="10" DataSourceID="SqlDataSource2" GridLines="Both" RepeatColumns="3" RepeatDirection="Horizontal" style="text-align: center; font-size: x-large">
                            <ItemTemplate>
                                <asp:Label ID="c_ply_noLabel" runat="server" Text='<%# Eval("c_ply_no") %>' />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" 
                CellPadding="3" Font-Size="Small" AllowSorting="True" 
                AutoGenerateColumns="False" EnableModelValidation="True" Width="322px" style="margin-top: 0px; font-size: xx-large;" Visible="False">
        <Columns>
            <asp:BoundField DataField="c_ply_no" HeaderText="获奖保单号" SortExpression="c_ply_no" />
        </Columns>
            </asp:GridView>
                    </td>
                </tr>
            </table>
        <br />
    </div>
    </form>
</body>
</html>
