<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="car3.aspx.cs" Inherits="_3Glist.car3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>五等奖</title>
    <style type="text/css">
        .auto-style1 {}
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
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
           ProviderName="<%$ ConnectionStrings:3glist.ProviderName %>" 
           SelectCommand="SELECT Top 50 * FROM t_ply_base Where c_status = '0' order by NEWID()">
           <SelectParameters>
             <asp:ControlParameter ControlID="DropDownList1" Name="c_prod_no" PropertyName="SelectedValue" />
           </SelectParameters>
        </asp:SqlDataSource>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Main.aspx">返回主页</asp:HyperLink>
                </td>
                <td style="text-align: right">险种列表：<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="c_category_no" DataValueField="c_kind_no">
        </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2">
        <asp:Button ID="Button1" runat="server" Text="导出获奖清单" onclick="Button1_Click" Visible="False" />
        <asp:Button ID="Button2" runat="server" Text="更新清单" onclick="Button2_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center" class="auto-style3">
                    获奖保单号</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:DataList ID="DataList1" runat="server" CellSpacing="10" DataSourceID="SqlDataSource2" GridLines="Both" RepeatColumns="5" RepeatDirection="Horizontal" style="text-align: center; font-size: x-large">
                        <ItemTemplate>
                            <asp:Label ID="c_ply_noLabel" runat="server" Text='<%# Eval("c_ply_no") %>' />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
    
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" 
                CellPadding="3" Font-Size="Small" AllowSorting="True" 
                AutoGenerateColumns="False" EnableModelValidation="True" style="font-size: xx-large; text-align: center" Visible="False">
        <Columns>
            <asp:BoundField DataField="c_ply_no" HeaderText="获奖保单号" SortExpression="c_ply_no" />
        </Columns>
        </asp:GridView>
    
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
