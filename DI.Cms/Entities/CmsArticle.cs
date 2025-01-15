using SqlSugar;
using System;
using System.Collections.Generic;
using DI.Data.Entities;

namespace DI.Cms.Data.Entities
{
    /// <summary>
    ///  文章 对象 cms_article
    ///  author di.net
    ///  date   2025-01-14 13:52:14
    /// </summary>
    [SugarTable("cms_article", "文章")]
    public class CmsArticle : BaseEntity
    {
        /// <summary>
        /// ID (article_id)
        /// </summary>
        [SugarColumn(ColumnName = "article_id", ColumnDescription = "ID", IsPrimaryKey = true, IsIdentity = true)]
        public int ArticleId { get; set; }
                
        /// <summary>
        /// 标题 (article_title)
        /// </summary>
        [SugarColumn(ColumnName = "article_title", ColumnDescription = "标题")]
        public string? ArticleTitle { get; set; }
                
        /// <summary>
        /// 作者 (article_author)
        /// </summary>
        [SugarColumn(ColumnName = "article_author", ColumnDescription = "作者")]
        public string? ArticleAuthor { get; set; }
                
        /// <summary>
        /// 内容 (article_content)
        /// </summary>
        [SugarColumn(ColumnName = "article_content", ColumnDescription = "内容")]
        public string? ArticleContent { get; set; }
                
        /// <summary>
        /// 摘要 (article_summary)
        /// </summary>
        [SugarColumn(ColumnName = "article_summary", ColumnDescription = "摘要")]
        public string? ArticleSummary { get; set; }
                
        /// <summary>
        /// 状态 (status)
        /// </summary>
        [SugarColumn(ColumnName = "status", ColumnDescription = "状态")]
        public string? Status { get; set; }
                
    }
}
