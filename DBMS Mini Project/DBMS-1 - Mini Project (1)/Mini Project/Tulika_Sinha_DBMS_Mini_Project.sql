use ipl;
#1.	Show the percentage of wins of each bidder in the order of highest to lowest percentage.

select b.BIDDER_ID,bd.BID_STATUS,count(bd.BID_STATUS) as won_count,bp.NO_OF_BIDS,((count(bd.BID_STATUS)/bp.NO_OF_BIDS)*100) as Percentage_of_win
from ipl_bidder_details b
join ipl_bidding_details bd
on b.BIDDER_ID=bd.BIDDER_ID
join ipl_bidder_points bp
on bp.BIDDER_ID=b.BIDDER_ID
where bd.BID_STATUS like '%won%'
group by b.BIDDER_ID
order by Percentage_of_win desc;

#2.	Display the number of matches conducted at each stadium with stadium name, city from the database.

select ips.STADIUM_ID,ips.STADIUM_NAME,ips.CITY,count(MATCH_ID) as number_of_matches
from ipl_stadium ips
join ipl_match_schedule im
on im.STADIUM_ID=ips.STADIUM_ID
group by ips.STADIUM_ID;

#3.	In a given stadium, what is the percentage of wins by a team which has won the toss?

select TOSS_WINNER,count(TOSS_WINNER),(count(TOSS_WINNER)/120)*100
from ipl_match
group by TOSS_WINNER;

#4.	Show the total bids along with bid team and team name.

select ip.BIDDER_ID,ip.BID_TEAM,it.TEAM_NAME,count(BID_STATUS) as total_bids
from ipl_bidding_details ip
join ipl_team it
on ip.BID_TEAM=it.TEAM_ID
group by ip.BID_TEAM;

#5.	Show the team id who won the match as per the win details.

select b.MATCH_ID,a.TEAM_ID,a.TEAM_NAME,b.WIN_DETAILS
from ipl_team a
join ipl_match b
on substr(substring_index(b.WIN_DETAILS," ",2),6,3)=a.REMARKS;

#6.	Display total matches played, total matches won and total matches lost by team along with its team name.

select sum(i.MATCHES_PLAYED) as total_matches_played,sum(i.MATCHES_WON) as matches_won,sum(MATCHES_LOST) as matches_lost,it.TEAM_NAME
from ipl_team_standings i
join ipl_team it
on it.TEAM_ID=i.TEAM_ID
group by it.TEAM_NAME;


#7.	Display the bowlers for Mumbai Indians team.

select ip.PLAYER_ROLE,ip.PLAYER_ID,i.PLAYER_NAME
from ipl_team_players ip
join ipl_player i
on i.PLAYER_ID=ip.PLAYER_ID
join ipl_team it
on it.TEAM_ID=ip.TEAM_ID
where ip.PLAYER_ROLE='Bowler' and it.TEAM_NAME='Mumbai Indians';

#8.	How many all-rounders are there in each team, Display the teams with more than 4 all-rounder in descending order.

select count(ip.PLAYER_ROLE) as no_of_all_rounders,ip.TEAM_ID
from ipl_team_players ip
where ip.PLAYER_ROLE='All-Rounder'
group by ip.TEAM_ID
having count(ip.PLAYER_ROLE)>4
order by count(ip.PLAYER_ROLE) desc;


