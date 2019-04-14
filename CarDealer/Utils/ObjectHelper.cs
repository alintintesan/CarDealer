using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Utils
{
    class ObjectHelper
    {
        public static T DeepCopy<T>(T obj)
        {
            object result = null;
            using (MemoryStream stream = new MemoryStream())
            {
                var formatter = new BinaryFormatter();
                formatter.Serialize(stream, obj);
                stream.Position = 0;
                result = formatter.Deserialize(stream);
                stream.Close();
            }
            return (T)result;
        }
    }
}
