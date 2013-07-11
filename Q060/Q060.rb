MAX = 10_000 #tried that, it worked

@start = Time.new

$sieve = Array.new(MAX+1, true)
$primes = Array.new

class Integer
   def prime?
      return $sieve[self] if self < $sieve.length
      
      lim = Math.sqrt(self).to_i + 1
      
      $primes.each do |p|
         return false if self%p == 0
         return true if p > lim
      end
      
      $primes.last.step(lim, 2) do |i|
         return false if self%i
      end
      
      true
   end
end


$sieve[0] = $sieve[1] = false
4.step(MAX, 2) do |i|
   $sieve[i] = false
end

3.step(MAX, 2) do |p|
   next if !$sieve[p]
   
   $primes << p
   
   (p+p).step(MAX, p) do |i|
      $sieve[i] = false
   end
end

def prime_concat?(a, b)
   as = a.to_s
   bs = b.to_s
   (as+bs).to_i.prime? and (bs+as).to_i.prime?
end

def solve(list)
   (list.length-1).times do |i1|
      templist = Array.new
      last1 = list[i1].last
      (i1+1).upto(list.length-1) do |i2|			
         last2 = list[i2].last
         if prime_concat?(last1, last2) then
            newlist = list[i1].clone.push(last2) 
            templist << newlist
            if templist.last.length == 5 then
               puts templist.last.inject { |num, sum| num+sum }
               puts "time: #{Time.now.to_f - @start.to_f}"
               exit(0)
            end	
         end
      end
      solve(templist)
   end
end


($primes.length-1).times do |p1|	
   list = Array.new
   (p1+1).upto($primes.length-1) do |p2|
      list << [$primes[p1], $primes[p2]] if prime_concat?($primes[p1], $primes[p2])
   end
   solve(list)
end
