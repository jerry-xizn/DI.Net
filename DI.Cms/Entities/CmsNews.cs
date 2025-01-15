using SqlSugar;
using System;
using System.Collections.Generic;
using DI.Data.Entities;

namespace DI.Cms.Data.Entities
{
    /// <summary>
    ///  新闻管理 对象 cms_news
    ///  author di.net
    ///  date   2025-01-14 17:08:44
    /// </summary>
    [SugarTable("cms_news", "新闻")]
    public class CmsNews : BaseEntity
    {
        /// <summary>
        /// ID (news_id)
        /// </summary>
        [SugarColumn(ColumnName = "news_id", ColumnDescription = "ID", IsPrimaryKey = true, IsIdentity = true)]
        public int NewsId { get; set; }
                
        /// <summary>
        /// 标题 (news_title)
        /// </summary>
        [SugarColumn(ColumnName = "news_title", ColumnDescription = "标题")]
        public string? NewsTitle { get; set; }
                
        /// <summary>
        /// 作者 (news_author)
        /// </summary>
        [SugarColumn(ColumnName = "news_author", ColumnDescription = "作者")]
        public string? NewsAuthor { get; set; }
                
        /// <summary>
        /// 内容 (news_content)
        /// </summary>
        [SugarColumn(ColumnName = "news_content", ColumnDescription = "内容")]
        public string? NewsContent { get; set; }
                
        /// <summary>
        /// 摘要 (news_summary)
        /// </summary>
        [SugarColumn(ColumnName = "news_summary", ColumnDescription = "摘要")]
        public string? NewsSummary { get; set; }
                
        /// <summary>
        /// 状态 (status)
        /// </summary>
        [SugarColumn(ColumnName = "status", ColumnDescription = "状态")]
        public string? Status { get; set; }
                
    }
}
