Leetcode https://leetcode.com/problems/count-the-number-of-experiments/

select p.platform,e.experiment_name,count(exp.experiment_id) as num_experiments
from
(select 'Android' as platform from dual
UNION ALL select 'IOS' from dual
UNION ALL select 'Web' from dual)p
CROSS JOIN
(select 'Reading' as experiment_name from dual
UNION ALL select 'Sports' from dual
UNION ALL select 'Programming' from dual)e
LEFT JOIN Experiments exp
ON exp.platform = p.platform
AND exp.experiment_name = e.experiment_name
group by p.platform,e.experiment_name

CROSS JOIN builds all possible combinations, LEFT JOIN preserves them
while attaching matching data, and COUNT on the right table’s column turns the missing matches into zeros.
