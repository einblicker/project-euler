object Problem61 extends App {
  def polyNums(p: Int) = Stream.from(1).map(n => n*(n*(p-2)-p+4)/2)
  def ps(x: Int) = polyNums(x).dropWhile(1000 >).takeWhile(10000 >)
  def list(xs: Seq[Int]) = {
    def joinable(x: Int, n: Int) = {
      ps(xs(n)).filter(x % 100 == _ / 100)
    }
    (for {
      a <- ps(3)
      b <- joinable(a, 0)
      c <- joinable(b, 1)
      d <- joinable(c, 2)
      e <- joinable(d, 3)
      f <- joinable(e, 4)
    } yield Seq(a, b, c, d, e, f)).filter(xs => (xs.head / 100) == (xs.last % 100))
  }
  def answer() = (4 to 8).permutations.map(list).filterNot(_.isEmpty).toStream.head.head.sum
}
