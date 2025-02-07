using Newtonsoft.Json.Linq;
using DI.Framework;
using DI.Framework.Logging;
using DI.Framework.RemoteRequest.Extensions;
using DI.Framework.Utils;
using System.Security.Cryptography;

namespace DI.Common.Utils
{
    public static class RandomUtils
    {
        /// <summary>
        /// 获取随机数
        /// </summary>
        /// <param name="length">随机数的长度</param>
        /// <returns></returns>
        public static long GetRandomNumber(int length)
        {
            // 创建 RandomNumberGenerator 实例
            RandomNumberGenerator rng = RandomNumberGenerator.Create();
            // 定义字节数组来存储生成的随机数
            byte[] randomBytes = new byte[length];
            // 使用 RandomNumberGenerator 生成随机字节
            rng.GetBytes(randomBytes);
            // 打印生成的随机字节数组中的元素
            foreach (byte b in randomBytes)
            {
                Console.Write(b + " ");
            }
            long randomInt = BitConverter.ToInt64(randomBytes, 0);
            Console.WriteLine(randomInt);
            return randomInt;
        }
    }
}
