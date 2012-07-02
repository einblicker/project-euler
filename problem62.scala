object Problem62 {
  implicit def longToList(x: Long) = new LongToList(x)
  class LongToList(x: Long) {
    private val zero = '0'.toInt
    def toList() = x.toString.toList.map(_.toInt - zero)
  }
  import collection.mutable.HashMap
  def frequency(xs: List[Int]): Map[Int, Int] = {
    val freq = HashMap[Int,Int]().withDefaultValue(0)
    for(x <- xs) {
      freq(x) += 1
    }
    Map(freq.toList : _*)
  }

  import util.control.Breaks.{break, breakable}
  import collection.mutable.ListBuffer
  def search() = {
    val m = HashMap[Map[Int,Int],ListBuffer[Int]]().withDefault(_ => ListBuffer())
    breakable {
      for(i <- 100 to 10000) {
	val key = frequency(math.pow(i, 3).toLong.toList)
	val l = m(key)
	l += i
	m(key) = l
	val x = m.values.map(_.length)
	if (i % 100 == 0) println(i)
	if (!x.isEmpty && x.max >= 5) break
      }
    }
    m.collectFirst{case (k, v) if v.length >= 5 => v}
  }
}
