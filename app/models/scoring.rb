class Scoring < ApplicationRecord
#親の場合
  enum host: { 1scoring: 0, 2scoring: 1, 3scoring: 2, 4scoring: 3, 6scoring: 4, 8scoring: 5, 11scoring: 6, 13scoring: 7 }
#子の場合
  enum non_host: { 1scoring: 0, 2scoring: 1, 3scoring: 2, 4scoring: 3, 6scoring: 4, 8scoring: 5, 11scoring: 6, 13scoring: 7 }
end
