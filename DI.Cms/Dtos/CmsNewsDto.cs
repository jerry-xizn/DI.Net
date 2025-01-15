using System.Collections.Generic;
using DI.Data.Dtos;

namespace DI.Cms.Data.Dtos
{
    /// <summary>
    ///  新闻管理 对象 cms_news
    ///  author di.net
    ///  date   2025-01-14 17:08:44
    /// </summary>
    public class CmsNewsDto : BaseDto
    {
        /// <summary>
        /// ID
        /// </summary>
        public int NewsId { get; set; }
                
        /// <summary>
        /// 标题
        /// </summary>
        public string? NewsTitle { get; set; }
                
        /// <summary>
        /// 作者
        /// </summary>
        public string? NewsAuthor { get; set; }
                
        /// <summary>
        /// 内容
        /// </summary>
        public string? NewsContent { get; set; }
                
        /// <summary>
        /// 摘要
        /// </summary>
        public string? NewsSummary { get; set; }
                
        /// <summary>
        /// 状态
        /// </summary>
        public string? Status { get; set; }
                
    }
}
