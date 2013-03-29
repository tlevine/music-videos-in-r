#Plot of rectangles demonstrating how many gifts my true love gave to me on all 12 days of christmas?

#Day number labels
days=1:12
#Gift number labels
gifts.num=days

#Gift word labels
gifts.nonum=c(
    'Drummers Drumming',
    'Pipers Piping',
    'Lords-a-Leaping',
    'Ladies Dancing',
    'Maids-a-Milking',
    'Swans-a-Swimming',
    'Geese-a-Laying',
    'Gold Rings',
    'Colly Birds',
    'French Hens',
    'Turtle Doves',
    #'Partridge in a Pear Tree'
    'Partridges in a Pear Tree'
)
gifts.nonum=gifts.nonum[length(gifts.nonum):1]
gifts=paste(1:12,gifts.nonum)
gifts[1]='A Partridge in a Pear Tree'


height.vid=9/16
width.vid=16/9

baseplot=function(){
	#Set up the coordinate system
	plot(type='n',
		x=-2+c(1,80),
		y=-15+c(-15,height.vid*80-15),
		xlim=-2+c(1,80),
		ylim=-15+c(-15,height.vid*80-15),
		asp=1,
	#	xlab='Day',
		xlab='',
		ylab='',
	#	main=paste('My true love gave me',sum((13-days)*days),'gifts on the twelve days of Christmas.'),
		main='',
		axes=F,
	)
}

#Start in the top-left corner with the first partridge
#Coordinates for the rectangle for a gift number on a particular date
#Gift number corresponds to the number of gifts given on that date
#giftcoords=function(day,gift) {list(
daygiftcount.fn=function(day) {
	sum(gifts.num[1:day])
}

giftrect=function(gift,day=NA,col='grey80') {
	daygiftcount=daygiftcount.fn(day)
	rect(
		#Gifts enter right to left
	#	xleft  =sum(gifts.num[0:(gift-1)]),
	#	ybottom=0-day,
	#	xright =sum(gifts.num[1:gift]),
	#	ytop   =1-day,

		#Gifts enter left to right
		xleft  =daygiftcount-sum(gifts.num[0:(gift-1)]),
		ybottom=0-day,
		xright =daygiftcount-sum(gifts.num[1:gift]),
		ytop   =1-day,

		col=col,
		border=NA
	)
}

#Plot all of the gifts until the entered day
dayrect=function(day) {
	for (pastday in 1:day) {
		sapply(1:pastday,giftrect,day=pastday)
	}
}

giftframe=function(gift,day=NA,daylabel=T) {
	#Make the basic plot
	baseplot()
	
	#No need to plot day zero on day one
	if (day>1) {
		dayrect(day-1)
	}
	
	#If gift==0, just plot the past days in grey.
	#This is to clear the last colored rect
	if (gift>0){
		#Choose the color
		if (gift==5) {
			giftcolor='gold'
		} else {
		#} else if (gift %% 2 ==1) {
			giftcolor='red'
		#} else if (gift %% 2 ==0) {
		#	giftcolor='green'
		}
		
		#Plot the current gift
		giftrect(gift,day=day,col=giftcolor)
		
		#Label the gift
		text(
			x=0,y=5,
			labels=gifts[gift],
			pos=4,offset=0,
			#col='grey80',
			col=giftcolor,
			cex=12
		)
		
		#Label the y axis
		ordinalday(day)
	} else if (daylabel==T) {
		ordinalday(day+1)
	}
	
	#Plot the day's previous gifts
	if (gift<day) {
		sapply((gift+1):day,giftrect,day=day)
	}
	
	#Plot the current gifts per day
	giftsperday(
		gift,
		day,
		daygiftcount.fn(day),
		sum(gifts.num[day:gift])
	)
}

tick=function(x,ybottom=0) {
	lines(
		rep(x,2),
		c(ybottom,ybottom+1),
		lwd=3,
		col='grey80'
	)
}

ordinals=c('1st','2nd','3rd',paste(4:12,'th',sep=''))
ordinalday=function(day) {
#Write "1st", "2nd", &c. to the left
	text(
		x=0,
		y=0.5-day,
		labels=ordinals[day],
		col='grey80',
		pos=2,cex=6,
		offset=2.5
	)
}

giftsperday=function(gift,day,daygiftcount,giftssofar) {
	giftsperday.vector=sapply(1:12,daygiftcount.fn)
	sapply(giftsperday.vector,tick,ybottom=-16)
	lines(
		x=c(0,0),
		y=c(-18,0),
		lwd=3,
		col='grey80'
	)
	text(
		x=giftsperday.vector,
		y=-18,
		labels=giftsperday.vector,
		col='grey80',
		pos=3,cex=6,
		offset=0
	)
	text(
		x=0,
		y=-21,
		labels='Gifts per day',
		col='grey80',
		pos=4,cex=6,
		offset=0
		#offset=2.5
	)
}


#Now do the actual plotting
pdf('gifts_slideshow.pdf',
	width =3*16,
	height=3*9,
#	pointsize=144
)

for (day in 1:12) {
	#Frame with ordinal before gifts
	giftframe(0,day=day-1,daylabel=F)
	giftframe(0,day=day-1,daylabel=T)
	sapply(day:1,giftframe,day=day)
}
#Final frame with everything
giftframe(0,day=12,daylabel=F)
#text(
#	x=0,y=5,
#	labels='364 Gifts',
#	pos=4,offset=0,
#	#col='grey80',
#	col=giftcolor,
#	cex=12
#)

dev.off()
