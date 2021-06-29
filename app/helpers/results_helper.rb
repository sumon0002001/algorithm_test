module ResultsHelper
    def LongestSubstring(s)
        low = {}
  i = 0
  start = 0
  s_chars = s.chars
  result = 0
  while i < s_chars.length
    if !low[s_chars[i]]
      low[s_chars[i]] = i
    else
      if result < i-start
        result = i-start
        longest_subsequence = s[start..i-1]
      end
      prev_pos = low[s_chars[i]] # where did we previously find the repeated character
      start = prev_pos + 1 # start after the repeated character
      low[s_chars[i]] = i # update the new position for the repeated character
    end
    i += 1
  end

  if result < i-start
    result = i-start
    longest_subsequence = s[start..i-1]
  end
  longest_subsequence
end
end
