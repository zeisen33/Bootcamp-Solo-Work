require "byebug"

def some?(arr, &prc)
    arr.each {|el| return true if prc[el]}
    false
end 
# p some?([3, 1, 11, 5]) { |n| n.even? }                                # false
# p some?([3, 4, 11, 5]) { |n| n.even? }                                # true
# p some?([8, 2]) { |n| n.even? }                                       # true
# p some?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' } # false
# p some?(['squash', 'corn', 'kale', 'potato']) { |str| str[0] == 'p' } # true
# p some?(['parsnip', 'lettuce', 'pea']) { |str| str[0] == 'p' }        # true

def exactly?(arr, n, &prc)
    count = 0
    arr.each {|el| count += 1 if prc[el]}
    count == n
end
# p exactly?(['A', 'b', 'C'], 2) { |el| el == el.upcase }         # true
# p exactly?(['A', 'B', 'C'], 2) { |el| el == el.upcase }         # false
# p exactly?(['A', 'B', 'C'], 3) { |el| el == el.upcase }         # true
# p exactly?(['cat', 'DOG', 'bird'], 1) { |el| el == el.upcase }  # true
# p exactly?(['cat', 'DOG', 'bird'], 0) { |el| el == el.upcase }  # false
# p exactly?(['cat', 'dog', 'bird'], 0) { |el| el == el.upcase }  # true
# p exactly?([4, 5], 3) { |n| n > 0 }                             # false
# p exactly?([4, 5, 2], 3) { |n| n > 0 }                          # true
# p exactly?([42, -9, 7, -3, -6], 2) { |n| n > 0 }                # true

def filter_out(arr, &prc)
    newArr = []
    arr.each {|el| newArr << el if !prc[el]}
    newArr
end
# p filter_out([10, 6, 3, 2, 5 ]) { |x| x.odd? }      # [10, 6, 2]
# p filter_out([1, 7, 3, 5 ]) { |x| x.odd? }          # []
# p filter_out([10, 6, 3, 2, 5 ]) { |x| x.even? }     # [3, 5]
# p filter_out([1, 7, 3, 5 ]) { |x| x.even? }         # [1, 7, 3, 5]

def at_least?(arr, n, &prc)
    count = 0
    arr.each {|el| count += 1 if prc[el]}
    count >= n
end
# p at_least?(['sad', 'quick', 'timid', 'final'], 2) { |s| s.end_with?('ly') }
# # false
# p at_least?(['sad', 'quickly', 'timid', 'final'], 2) { |s| s.end_with?('ly') }
# # false
# p at_least?(['sad', 'quickly', 'timidly', 'final'], 2) { |s| s.end_with?('ly') }
# # true
# p at_least?(['sad', 'quickly', 'timidly', 'finally'], 2) { |s| s.end_with?('ly') }
# # true
# p at_least?(['sad', 'quickly', 'timid', 'final'], 1) { |s| s.end_with?('ly') }
# # true
# p at_least?(['sad', 'quick', 'timid', 'final'], 1) { |s| s.end_with?('ly') }
# # false
# p at_least?([false, false, false], 3) { |bool| bool }
# # false
# p at_least?([false, true, true], 3) { |bool| bool }
# # false
# p at_least?([true, true, true], 3) { |bool| bool }
# # true
# p at_least?([true, true, true, true], 3) { |bool| bool }

def every?(arr, &prc)
    arr.each {|el| return false if !prc[el]}
    true
end
# p every?([3, 1, 11, 5]) { |n| n.even? }                                 # false
# p every?([2, 4, 4, 8]) { |n| n.even? }                                  # true
# p every?([8, 2]) { |n| n.even? }                                        # true
# p every?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' }  # false
# p every?(['squash', 'pea', 'kale', 'potato']) { |str| str[0] == 'p' }   # false
# p every?(['parsnip', 'potato', 'pea']) { |str| str[0] == 'p' }          # true

def at_most?(arr, n, &prc)
    count = 0
    arr.each {|el| count += 1 if prc[el]}
    count <= n
end
# p at_most?([-4, 100, -3], 1) { |el| el > 0 }                         # true
# p at_most?([-4, -100, -3], 1) { |el| el > 0 }                        # true
# p at_most?([4, 100, -3], 1) { |el| el > 0 }                          # false
# p at_most?([4, 100, 3], 1) { |el| el > 0 }                           # false
# p at_most?(['r', 'q', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }    # true
# p at_most?(['r', 'i', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }    # true
# p at_most?(['r', 'i', 'e', 'o'], 2) { |el| 'aeiou'.include?(el) }    # false

def first_index(arr, &prc)
    arr.each {|el| return arr.index(el) if prc[el]}
    return nil
end
# p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.length > 3 }           # 2
# p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 3 } # 0
# p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 6 } # nil
# p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 'b' }            # 0
# p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.include?('a') }        # 1
# p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 't' }            # nil

def xnor_select(arr, prc1, prc2)
    newArr = []
    arr.each {|el| newArr << el if (prc1[el] && prc2[el]) || (!prc1[el] && !prc2[el])}
    newArr
end
# is_even = Proc.new { |n| n % 2 == 0 }
# is_odd = Proc.new { |n| n % 2 != 0 }
# is_positive = Proc.new { |n| n > 0 }
# p xnor_select([8, 3, -4, -5], is_even, is_positive)         # [8, -5]
# p xnor_select([-7, -13, 12, 5, -10], is_even, is_positive)  # [-7, -13, 12]
# p xnor_select([-7, -13, 12, 5, -10], is_odd, is_positive)   # [5, -10]

def filter_out!(arr, &prc)
    arr.select! {|el| !prc[el]}
end
# arr_1 = [10, 6, 3, 2, 5 ]
# filter_out!(arr_1) { |x| x.odd? }
# p arr_1     # [10, 6, 2]

# arr_2 = [1, 7, 3, 5 ]
# filter_out!(arr_2) { |x| x.odd? }
# p arr_2     # []

# arr_3 = [10, 6, 3, 2, 5 ]
# filter_out!(arr_3) { |x| x.even? }
# p arr_3     # [3, 5]

# arr_4 = [1, 7, 3, 5 ]
# filter_out!([1, 7, 3, 5 ]) { |x| x.even? }
# p arr_4 # [1, 7, 3, 5]

def multi_map(arr, n=1, &prc)
    currArr = arr
    n.times do 
        currArr.map! {|el| prc[el]}
    end
    currArr
end
# p multi_map(['pretty', 'cool', 'huh?']) { |s| s + '!'}      # ["pretty!", "cool!", "huh?!"]
# p multi_map(['pretty', 'cool', 'huh?'], 1) { |s| s + '!'}   # ["pretty!", "cool!", "huh?!"]
# p multi_map(['pretty', 'cool', 'huh?'], 3) { |s| s + '!'}   # ["pretty!!!", "cool!!!", "huh?!!!"]
# p multi_map([4, 3, 2, 7], 1) { |num| num * 10 }             # [40, 30, 20, 70]
# p multi_map([4, 3, 2, 7], 2) { |num| num * 10 }             # [400, 300, 200, 700]
# p multi_map([4, 3, 2, 7], 4) { |num| num * 10 }             # [40000, 30000, 20000, 70000]

def proctition(arr, &prc)
    trues = arr.select {|el| prc[el]}
    falses = arr.select {|el| !prc[el]}
    trues + falses
end
# p proctition([4, -5, 7, -10, -2, 1, 3]) { |el| el > 0 }
# # [4, 7, 1, 3, -5, -10, -2]

# p proctition([7, 8, 3, 6, 10]) { |el| el.even? }
# # [8, 6, 10, 7, 3]

# p proctition(['cat','boot', 'dog', 'bug', 'boat']) { |s| s[0] == 'b' }
# # ["boot", "bug", "boat", "cat", "dog"]

def selected_map!(arr, prc1, prc2)
    arr.map! do |el|
        if prc1[el]
            prc2[el]
        else
            el  
        end 
    end
    nil
end
is_even = Proc.new { |n| n.even? }
is_positive = Proc.new { |n| n > 0 }
square = Proc.new { |n| n * n }
flip_sign = Proc.new { |n| -n }

# arr_1 = [8, 5, 10, 4]
# p selected_map!(arr_1, is_even, square)     # nil
# p arr_1                                     # [64, 5, 100, 16]

# arr_2 = [-10, 4, 7, 6, -2, -9]
# p selected_map!(arr_2, is_even, flip_sign)  # nil
# p arr_2                                     # [10, -4, 7, -6, 2, -9]

# arr_3 = [-10, 4, 7, 6, -2, -9]
# p selected_map!(arr_3, is_positive, square) # nil
# p arr_3                                     # [-10, 16, 49, 36, -2, -9]

def chain_map(val, procsArr)            # my code should be right but always returns float when answers sometimes return int
    currVal = val
    procsArr.each {|prc| currVal = prc[currVal]}
    currVal
end
# add_5 = Proc.new { |n| n + 5 }
# half = Proc.new { |n| n / 2.0 }
# square = Proc.new { |n| n * n }

# p chain_map(25, [add_5, half])          # 15.0
# p chain_map(25, [half, add_5])          # 17.5
# p chain_map(25, [add_5, half, square])  # 225
# p chain_map(4, [square, half])          # 8
# p chain_map(4, [half, square])          # 4

def proc_suffix(sen, hsh)
    words = sen.split(' ')
    words.each.with_index do |word, idx|
        suffixes = []
        hsh.each do |prc, suffix|
            suffixes << suffix if prc[word]
        end
        suffixes.each do |suff|
            words[idx] += suff
        end
    end
    words.join(' ')
end
# contains_a = Proc.new { |w| w.include?('a') }
# three_letters = Proc.new { |w| w.length == 3 }
# four_letters = Proc.new { |w| w.length == 4 }

# p proc_suffix('dog cat',
#     contains_a => 'ly',
#     three_letters => 'o'
# )   # "dogo catlyo"

# p proc_suffix('dog cat',
#     three_letters => 'o',
#     contains_a => 'ly'
# )   # "dogo catoly"

# p proc_suffix('wrong glad cat',
#     contains_a => 'ly',
#     three_letters => 'o',
#     four_letters => 'ing'
# )   # "wrong gladlying catlyo"

# p proc_suffix('food glad rant dog cat',
#     four_letters => 'ing',
#     contains_a => 'ly',
#     three_letters => 'o'
# )   # "fooding gladingly rantingly dogo catlyo"

def proctition_platinum(arr, *prcs)
    hsh = Hash.new([])
    (1..prcs.length).each do |num|
        # debugger
        truesArr = []
        arr.each do |el|
            elIncl = hsh.any? {|k, v| v.include?(el)}
            if elIncl
                next
            else
                truesArr << el if prcs[num - 1][el]
            end
        end
        hsh[num] = truesArr
    end
    hsh
end

is_yelled = Proc.new { |s| s[-1] == '!' }
is_upcase = Proc.new { |s| s.upcase == s }
contains_a = Proc.new { |s| s.downcase.include?('a') }
begins_w = Proc.new { |s| s.downcase[0] == 'w' }

# p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, contains_a)
# # {1=>["when!", "WHERE!"], 2=>["what"]}

# p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, is_upcase, contains_a)
# # {1=>["when!", "WHERE!"], 2=>["WHO", "WHY"], 3=>["what"]}

# p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_upcase, is_yelled, contains_a)
# # {1=>["WHO", "WHERE!", "WHY"], 2=>["when!"], 3=>["what"]}

# p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], begins_w, is_upcase, is_yelled, contains_a)
# {1=>["WHO", "what", "when!", "WHERE!", "WHY"], 2=>[], 3=>[], 4=>[]}

def procipher(sen, hsh)
    words = sen.split(' ')
    words.each.with_index do |orig, idx|
        # debugger
        word = orig
        hsh.each do |kproc, vproc|
            word = vproc[word] if kproc[orig]
        end
        words[idx] = word

    end
    words.join(' ')
end
is_yelled = Proc.new { |s| s[-1] == '!' }
is_upcase = Proc.new { |s| s.upcase == s }
contains_a = Proc.new { |s| s.downcase.include?('a') }
make_question = Proc.new { |s| s + '???' }
reverse = Proc.new { |s| s.reverse }
add_smile = Proc.new { |s| s + ':)' }

# p procipher('he said what!',
#     is_yelled => make_question,
#     contains_a => reverse
# ) # "he dias ???!tahw"

# p procipher('he said what!',
#     contains_a => reverse,
#     is_yelled => make_question
# ) # "he dias !tahw???"

# p procipher('he said what!',
#     contains_a => reverse,
#     is_yelled => add_smile
# ) # "he dias !tahw:)"

# p procipher('stop that taxi now',
#     is_upcase => add_smile,
#     is_yelled => reverse,
#     contains_a => make_question
# ) # "stop that??? taxi??? now"

# p procipher('STOP that taxi now!',
#     is_upcase => add_smile,
#     is_yelled => reverse,
#     contains_a => make_question
# ) # "STOP:) that??? taxi??? !won"

def picky_procipher(sen, hsh)
    words = sen.split(' ')
    words.each.with_index do |orig, idx|
        # debugger
        changed = false
        word = orig
        hsh.each do |kproc, vproc|
            if !changed
                if kproc[orig]
                    word = vproc[word] 
                    changed = true
                end
            end
        end
        words[idx] = word
    end
    words.join(' ')
end
is_yelled = Proc.new { |s| s[-1] == '!' }
is_upcase = Proc.new { |s| s.upcase == s }
contains_a = Proc.new { |s| s.downcase.include?('a') }
make_question = Proc.new { |s| s + '???' }
reverse = Proc.new { |s| s.reverse }
add_smile = Proc.new { |s| s + ':)' }

p picky_procipher('he said what!',
    is_yelled => make_question,
    contains_a => reverse
) # "he dias what!???"

p picky_procipher('he said what!',
    contains_a => reverse,
    is_yelled => make_question
) # "he dias !tahw"

p picky_procipher('he said what!',
    contains_a => reverse,
    is_yelled => add_smile
) # "he dias !tahw"

p picky_procipher('stop that taxi now',
    is_upcase => add_smile,
    is_yelled => reverse,
    contains_a => make_question
) # "stop that??? taxi??? now"

p picky_procipher('STOP that taxi!',
    is_upcase => add_smile,
    is_yelled => reverse,
    contains_a => make_question
) # "STOP:) that??? !ixat"