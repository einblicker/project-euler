let rec digits n = seq {
  match n with
  | n when n = 0I -> ()
  | n ->
    yield n % 10I
    yield! digits <| n / 10I
}

let rec a = seq {
  yield! [2I; 1I; 2I; 1I]
  for n in Seq.skip 1 a do
    yield if n = 1I then 1I else n + 2I
}

let rec p = Seq.cache <| seq {
  yield 1I
  yield Seq.head a
  for a1, p0, p1 in Seq.zip3 (Seq.skip 1 a) p (Seq.skip 1 p) do
    yield a1 * p1 + p0
}

Seq.nth 100 p
|> digits
|> Seq.sum
|> printfn "%A"