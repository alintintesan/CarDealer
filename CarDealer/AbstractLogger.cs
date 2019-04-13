using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer
{
    abstract class AbstractLogger
    {
        public static int info = 1;
        public static int debug = 2;
        public static int error = 3;
        protected int level;

        protected AbstractLogger nextLogger;

        public void setNextLogger(AbstractLogger nextLogger)
        {
            this.nextLogger = nextLogger;
        }

        public void logMessage(int level, String message)
        {
            if(this.level <= level)
            {
                Console.WriteLine(message);
            }
            if(nextLogger != null)
            {
                nextLogger.logMessage(level, message);
            }
        }

        abstract protected void write(String message);
    }
}
