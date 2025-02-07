using SqlSugar;
using System;
using System.Collections.Generic;
using DI.Data.Entities;

namespace DI.System.Data.Entities
{
    /// <summary>
    ///  订单明细表 对象 cms_order_detail
    ///  author di.net
    ///  date   2025-01-24 13:57:34
    /// </summary>
    [SugarTable("cms_order_detail", "订单明细表")]
    public class CmsOrderDetail : BaseEntity
    {
        /// <summary>
        /// 订单明细ID (id)
        /// </summary>
        [SugarColumn(ColumnName = "id", ColumnDescription = "订单明细ID", IsPrimaryKey = true)]
        public long Id { get; set; }
                
        /// <summary>
        /// 订单ID (order_id)
        /// </summary>
        [SugarColumn(ColumnName = "order_id", ColumnDescription = "订单ID")]
        public long? OrderId { get; set; }
                
        /// <summary>
        /// 明细行号 (line_no)
        /// </summary>
        [SugarColumn(ColumnName = "line_no", ColumnDescription = "明细行号")]
        public int? LineNo { get; set; }
                
        /// <summary>
        /// 货品代码 (item_id)
        /// </summary>
        [SugarColumn(ColumnName = "item_id", ColumnDescription = "货品代码")]
        public string? ItemId { get; set; }
                
        /// <summary>
        /// 货品名称 (item_name)
        /// </summary>
        [SugarColumn(ColumnName = "item_name", ColumnDescription = "货品名称")]
        public int? ItemName { get; set; }
                
        /// <summary>
        /// 货品数量 (item_qty)
        /// </summary>
        [SugarColumn(ColumnName = "item_qty", ColumnDescription = "货品数量")]
        public int? ItemQty { get; set; }
                
        /// <summary>
        /// 货品单价 (item_price)
        /// </summary>
        [SugarColumn(ColumnName = "item_price", ColumnDescription = "货品单价")]
        public string? ItemPrice { get; set; }
                
        /// <summary>
        /// 货品总金额 (item_amount)
        /// </summary>
        [SugarColumn(ColumnName = "item_amount", ColumnDescription = "货品总金额")]
        public string? ItemAmount { get; set; }
                
        /// <summary>
        /// 明细行状态 (order_detail_status)
        /// </summary>
        [SugarColumn(ColumnName = "order_detail_status", ColumnDescription = "明细行状态")]
        public int? OrderDetailStatus { get; set; }
                
        /// <summary>
        /// 部门代码 (dept_id)
        /// </summary>
        [SugarColumn(ColumnName = "dept_id", ColumnDescription = "部门代码")]
        public long? DeptId { get; set; }
                
        /// <summary>
        /// 组织代码 (org_id)
        /// </summary>
        [SugarColumn(ColumnName = "org_id", ColumnDescription = "组织代码")]
        public long? OrgId { get; set; }
                
        /// <summary>
        /// 应用代码 (app_id)
        /// </summary>
        [SugarColumn(ColumnName = "app_id", ColumnDescription = "应用代码")]
        public long? AppId { get; set; }
                
        /// <summary>
        /// 行版本号 (record_version)
        /// </summary>
        [SugarColumn(ColumnName = "record_version", ColumnDescription = "行版本号")]
        public long? RecordVersion { get; set; }
                
    }
}
