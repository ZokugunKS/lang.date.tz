/**
 * index.ks
 * Version 0.1.0
 * December 19th, 2019
 *
 * Copyright (c) 2019 Baptiste Augrain
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 **/
require|import '@zokugun/lang'
require|import '@zokugun/lang.timezone'(...)

extern console

type NS = Number | String
type ST = String | Timezone

impl Date {
	private lateinit {
		@timezone: Timezone
		@utc: Number
	}
	overwrite constructor(date: Date) { // {{{
		@timezone = date.getTimezone()

		this.setTime(date.getTime())
	} // }}}
	constructor(timezone: ST) { // {{{
		if timezone is String {
			@timezone = Timezone.getOrUTC(timezone)
		}
		else {
			@timezone = timezone
		}

		this.setTime(this.getTime())
	} // }}}
	constructor(date: Date, timezone: ST) { // {{{
		this(date.getTime(), timezone)
	} // }}}
	constructor(time: Number, timezone: ST) { // {{{
		if timezone is String {
			@timezone = Timezone.getOrUTC(timezone)
		}
		else {
			@timezone = timezone
		}

		this.setTime(time)
	} // }}}
	constructor(year: NS, month: NS, day: NS, timezone: ST, beforeDSTFallBack: Boolean = true) ~ Error { // {{{
		this(year, month, day, 0, 0, 0, 0, timezone, beforeDSTFallBack)
	} // }}}
	constructor(year: NS, month: NS, day: NS, hours: NS, minutes: NS, seconds: NS, milliseconds: NS, timezone: ST, beforeDSTFallBack: Boolean = true) ~ Error { // {{{
		this(year, month, day, hours, minutes, seconds, milliseconds)

		if timezone is String {
			@timezone = Timezone.getOrUTC(timezone)
		}
		else {
			@timezone = timezone
		}

		const time = @timezone.getUTCTimestamp(this.getTime(), beforeDSTFallBack)

		this.setTime(time)
	} // }}}
	overwrite clone(): Date => new Date(this)
	overwrite getEpochTime(): Number => this.getTime()
	overwrite getTime(): Number { // {{{
		if const time = @utc {
			return time
		}
		else {
			return precursor()
		}
	} // }}}
	getTimezone(): Timezone { // {{{
		if const timezone = @timezone {
			return timezone
		}
		else {
			return Timezone.UTC
		}
	} // }}}
	getDSTOffset(timeUnit: TimeUnit = null): Number => this.getTimezone().getDSTOffset(this.getTime(), timeUnit)
	getUTCOffset(timeUnit: TimeUnit = null): Number => this.getTimezone().getUTCOffset(this.getTime(), timeUnit)
	isInDST(): Boolean => this.getTimezone().getDSTOffset(this) != 0
	overwrite isUTC(): Boolean => this.getTimezone().isUTC()
	overwrite minus(unit: TimeUnit, value: Number): this { // {{{
		return this if value == 0

		switch unit {
			TimeUnit::CENTURIES		=> this.minusYears(value * 100)
			TimeUnit::DAYS			=> this.minusDays(value)
			TimeUnit::DECADES		=> this.minusYears(value * 10)
			TimeUnit::HALF_DAYS		=> this.minusHours(value * 12)
			TimeUnit::HOURS			=> this.minusHours(value)
			TimeUnit::MILLENNIA		=> this.minusYears(value * 1_000)
			TimeUnit::MILLISECONDS	=> this.minusMilliseconds(value)
			TimeUnit::MINUTES		=> this.minusMinutes(value)
			TimeUnit::MONTHS		=> this.minusMonths(value)
			TimeUnit::QUARTERS		=> this.minusMonths(value * 3)
			TimeUnit::SECONDS		=> this.minusSeconds(value)
			TimeUnit::SEMESTERS		=> this.minusMonths(value * 6)
			TimeUnit::WEEKS			=> this.minusWeeks(value)
			TimeUnit::YEARS			=> this.minusYears(value)
		}
	} // }}}
	overwrite minusDays(value: Number): this { // {{{
		const time1 = this.getTime()
		const time2 = time1 - (value * 86_400_000)

		const diff = this.getTimezone().getDSTDifference(time1, time2, TimeUnit::MILLISECONDS)

		if diff == 0 {
			this.setTime(time2)
		}
		else {
			this.setTime(time2 + diff)
		}
	} // }}}
	overwrite minusHours(value: Number): this { // {{{
		const time1 = this.getTime()
		const time2 = time1 - (value * 3_600_000)

		this.setTime(time2)
	} // }}}
	overwrite minusMilliseconds(value: Number): this { // {{{
		const time1 = this.getTime()
		const time2 = time1 - value

		this.setTime(time2)
	} // }}}
	overwrite minusMinutes(value: Number): this { // {{{
		const time1 = this.getTime()
		const time2 = time1 - (value * 60_000)

		this.setTime(time2)
	} // }}}
	overwrite minusMonths(value: Number): this { // {{{
		return this if value == 0
		return this.plusMonths(-value) if value < 0

		auto days = 0
		auto month = this.getMonth()
		auto year = this.getYear()

		for const i from 0 til value - 1 {
			if --month < 1 {
				month = 12
				--year
			}

			days += Date.getDaysInMonth(year, month)
		}

		const dim = month == 1 ? Date.getDaysInMonth(year - 1, 12) : Date.getDaysInMonth(year, month - 1)
		const d = this.getDay() - dim
		if d <= 0 {
			days += dim
		}
		else {
			days += dim + d
		}

		const time1 = this.getTime()
		const time2 = time1 - (days * 86_400_000)

		const diff = this.getTimezone().getDSTDifference(time1, time2, TimeUnit::MILLISECONDS)

		if diff == 0 {
			this.setTime(time2)
		}
		else {
			this.setTime(time2 + diff)
		}
	} // }}}
	overwrite minusSeconds(value: Number): this { // {{{
		const time1 = this.getTime()
		const time2 = time1 - (value * 1_000)

		this.setTime(time2)
	} // }}}
	overwrite minusWeeks(value: Number): this { // {{{
		const time1 = this.getTime()
		const time2 = time1 - (value * 604_800_000)

		const diff = this.getTimezone().getDSTDifference(time1, time2, TimeUnit::MILLISECONDS)

		if diff == 0 {
			this.setTime(time2)
		}
		else {
			this.setTime(time2 + diff)
		}
	} // }}}
	overwrite minusYears(value: Number): this { // {{{
		return this if value == 0
		return this.plusYears(-value) if value < 0

		auto days = 0

		const month = this.getMonth()
		const year = this.getYear()

		for const i from 0 til value {
			days += Date.getDaysInYear(year - i)
		}

		const time1 = this.getTime()
		const time2 = time1 - (days * 86_400_000)

		const diff = this.getTimezone().getDSTDifference(time1, time2, TimeUnit::MILLISECONDS)

		if diff == 0 {
			this.setTime(time2)
		}
		else {
			this.setTime(time2 + diff)
		}
	} // }}}
	overwrite plus(unit: TimeUnit, value: Number): this { // {{{
		return this if value == 0

		switch unit {
			TimeUnit::CENTURIES		=> this.plusYears(value * 100)
			TimeUnit::DAYS			=> this.plusDays(value)
			TimeUnit::DECADES		=> this.plusYears(value * 10)
			TimeUnit::HALF_DAYS		=> this.plusHours(value * 12)
			TimeUnit::HOURS			=> this.plusHours(value)
			TimeUnit::MILLENNIA		=> this.plusYears(value * 1_000)
			TimeUnit::MILLISECONDS	=> this.plusMilliseconds(value)
			TimeUnit::MINUTES		=> this.plusMinutes(value)
			TimeUnit::MONTHS		=> this.plusMonths(value)
			TimeUnit::QUARTERS		=> this.plusMonths(value * 3)
			TimeUnit::SECONDS		=> this.plusSeconds(value)
			TimeUnit::SEMESTERS		=> this.plusMonths(value * 6)
			TimeUnit::WEEKS			=> this.plusWeeks(value)
			TimeUnit::YEARS			=> this.plusYears(value)
		}
	} // }}}
	overwrite plusDays(value: Number): this { // {{{
		const time1 = this.getTime()
		const time2 = time1 + (value * 86_400_000)

		const diff = this.getTimezone().getDSTDifference(time1, time2, TimeUnit::MILLISECONDS)

		if diff == 0 {
			this.setTime(time2)
		}
		else {
			this.setTime(time2 + diff)
		}
	} // }}}
	overwrite plusHours(value: Number): this { // {{{
		const time1 = this.getTime()
		const time2 = time1 + (value * 3_600_000)

		this.setTime(time2)
	} // }}}
	overwrite plusMilliseconds(value: Number): this { // {{{
		const time1 = this.getTime()
		const time2 = time1 + value

		this.setTime(time2)
	} // }}}
	overwrite plusMinutes(value: Number): this { // {{{
		const time1 = this.getTime()
		const time2 = time1 + (value * 60_000)

		this.setTime(time2)
	} // }}}
	overwrite plusMonths(value: Number): this { // {{{
		return this if value == 0
		return this.minusMonths(-value) if value < 0

		auto days = 0
		auto month = this.getMonth()
		auto year = this.getYear()

		for const i from 0 til value - 1 {
			days += Date.getDaysInMonth(year, month)

			if ++month > 12 {
				month = 1
				++year
			}
		}

		const dim = month == 12 ? Date.getDaysInMonth(year + 1, 1) : Date.getDaysInMonth(year, month + 1)
		const d = this.getDay() - dim
		if d <= 0 {
			days += Date.getDaysInMonth(year, month)
		}
		else {
			days += Date.getDaysInMonth(year, month) - d
		}

		const time1 = this.getTime()
		const time2 = time1 + (days * 86_400_000)

		const diff = this.getTimezone().getDSTDifference(time1, time2, TimeUnit::MILLISECONDS)

		if diff == 0 {
			this.setTime(time2)
		}
		else {
			this.setTime(time2 + diff)
		}
	} // }}}
	overwrite plusSeconds(value: Number): this { // {{{
		const time1 = this.getTime()
		const time2 = time1 + (value * 1_000)

		this.setTime(time2)
	} // }}}
	overwrite plusWeeks(value: Number): this { // {{{
		const time1 = this.getTime()
		const time2 = time1 + (value * 604_800_000)

		const diff = this.getTimezone().getDSTDifference(time1, time2, TimeUnit::MILLISECONDS)

		if diff == 0 {
			this.setTime(time2)
		}
		else {
			this.setTime(time2 + diff)
		}
	} // }}}
	overwrite plusYears(value: Number): this { // {{{
		return this if value == 0
		return this.minusYears(-value) if value < 0

		auto days = 0

		const month = this.getMonth()
		const year = month > 2 || (month == 2 && this.getDay() == 29) ? this.getYear() + 1 : this.getYear()

		for const i from 0 til value {
			days += Date.getDaysInYear(year + i)
		}

		const time1 = this.getTime()
		const time2 = time1 + (days * 86_400_000)

		const diff = this.getTimezone().getDSTDifference(time1, time2, TimeUnit::MILLISECONDS)

		if diff == 0 {
			this.setTime(time2)
		}
		else {
			this.setTime(time2 + diff)
		}
	} // }}}
	overwrite set(field: DateField, value: Number): this { // {{{
		switch field {
			DateField::DAY			=> this.setDay(value)
			DateField::DAY_OF_WEEK	=> this.setDayOfWeek(value)
			DateField::DAY_OF_YEAR	=> this.setDayOfYear(value)
			DateField::HOUR			=> this.setHour(value)
			DateField::MONTH		=> this.setMonth(value)
			DateField::MILLISECOND	=> this.setMillisecond(value)
			DateField::MINUTE		=> this.setMinute(value)
			DateField::SECOND		=> this.setSecond(value)
			DateField::WEEK			=> this.setWeek(value)
			DateField::YEAR			=> this.setYear(value)
		}
	} // }}}
	overwrite setEpochTime(time: Number): this => this.setTime(time)
	overwrite setDay(value: Number): this => this.plusDays(value - this.getDay())
	overwrite setHour(value: Number): this => this.plusHours(value - this.getHour())
	overwrite setMillisecond(value: Number): this => this.plusMilliseconds(value - this.getMillisecond())
	overwrite setMinute(value: Number): this => this.plusMinutes(value - this.getMinute())
	overwrite setMonth(value: Number): this => this.plusMonths(value - this.getMonth())
	overwrite setSecond(value: Number): this => this.plusSeconds(value - this.getSecond())
	overwrite setWeek(value: Number): this => this.plusWeeks(value - this.getWeek())
	overwrite setYear(value: Number): this => this.plusYears(value - this.getYear())
	overwrite setTime(time: Number): this { // {{{
		@utc = time

		precursor(time + this.getTimezone().getUTCOffset(time, TimeUnit::MILLISECONDS))
	} // }}}
	setTimezone(timezone: ST): this { // {{{
		if timezone is String {
			@timezone = Timezone.getOrUTC(timezone)
		}
		else {
			@timezone = timezone
		}

		return this.setTime(this.getTime())
	} // }}}
	overwrite toString(): String { // {{{
		if this.isUTC() {
			return precursor()
		}
		else {
			const offset = this.getUTCOffset()

			const asbolute = Math.abs(offset)
			const hours = asbolute /. 60
			const minutes = asbolute - (hours * 60)

			auto str = precursor()

			str = str.substring(0, str.length - 1)

			str += (offset >= 0 ? '+' : '-') + hours.zeroPad(2) + ':' + minutes.zeroPad(2)

			return str
		}
	} // }}}
	toUTC(): Date => new Date(this.getTime())
}

export Date, DateField, Timezone, TimeUnit, WeekField, ParseError