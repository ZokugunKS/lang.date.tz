#![bin]
#![error(off)]

extern {
	describe:	func
	it:			func
	console
}

import {
	'chai'		for expect
	'..'
}

describe('minus', func() {
	describe('year', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.minus(TimeUnit::YEARS, 1)

			expect(d.toString()).to.equal('1999-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('1999-06-26T10:00:00.000Z')
		}) // }}}

		it('ndst +10', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.minus(TimeUnit::YEARS, 10)

			expect(d.toString()).to.equal('1990-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('1990-06-26T10:00:00.000Z')
		}) // }}}

		it('ndst end 29.28 +1', func() { // {{{
			const d = new Date(2008, 2, 29, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2008-02-29T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2008-02-29T11:00:00.000Z')

			d.minus(TimeUnit::YEARS, 1)

			expect(d.toString()).to.equal('2007-02-28T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2007-02-28T11:00:00.000Z')
		}) // }}}

		it('ndst end 29.28 +4', func() { // {{{
			const d = new Date(2008, 2, 29, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2008-02-29T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2008-02-29T11:00:00.000Z')

			d.minus(TimeUnit::YEARS, 4)

			expect(d.toString()).to.equal('2004-02-29T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2004-02-29T11:00:00.000Z')
		}) // }}}

		it('wdst +1', func() { // {{{
			const d = new Date(2000, 3, 28, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-28T01:59:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-27T23:59:59.999Z')

			d.minus(TimeUnit::YEARS, 1)

			expect(d.toString()).to.equal('1999-03-28T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('1999-03-28T00:59:59.999Z')
		}) // }}}
	})

	describe('month', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 9, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-09-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-09-26T10:00:00.000Z')

			d.minus(TimeUnit::MONTHS, 1)

			expect(d.toString()).to.equal('2000-08-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-08-26T10:00:00.000Z')
		}) // }}}

		it('ndst +3', func() { // {{{
			const d = new Date(2000, 9, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-09-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-09-26T10:00:00.000Z')

			d.minus(TimeUnit::MONTHS, 3)

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')
		}) // }}}

		it('wdst +1', func() { // {{{
			const d = new Date(2000, 3, 28, 2, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-28T02:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-28T00:00:00.000Z')

			d.minus(TimeUnit::MONTHS, 1)

			expect(d.toString()).to.equal('2000-02-28T02:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2000-02-28T01:00:00.000Z')
		}) // }}}

		it('wdst +3', func() { // {{{
			const d = new Date(2000, 3, 28, 2, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-28T02:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-28T00:00:00.000Z')

			d.minus(TimeUnit::MONTHS, 3)

			expect(d.toString()).to.equal('1999-12-28T02:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('1999-12-28T01:00:00.000Z')
		}) // }}}

		it('end ndst 30.30 +1', func() { // {{{
			const d = new Date(2008, 5, 30, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2008-05-30T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2008-05-30T10:00:00.000Z')

			d.minus(TimeUnit::MONTHS, 1)

			expect(d.toString()).to.equal('2008-04-30T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2008-04-30T10:00:00.000Z')
		}) // }}}

		it('end ndst 31.30 +1', func() { // {{{
			const d = new Date(2008, 5, 31, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2008-05-31T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2008-05-31T10:00:00.000Z')

			d.minus(TimeUnit::MONTHS, 1)

			expect(d.toString()).to.equal('2008-04-30T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2008-04-30T10:00:00.000Z')
		}) // }}}

		it('end ndst 31.30 +4', func() { // {{{
			const d = new Date(2008, 8, 31, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2008-08-31T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2008-08-31T10:00:00.000Z')

			d.minus(TimeUnit::MONTHS, 4)

			expect(d.toString()).to.equal('2008-04-30T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2008-04-30T10:00:00.000Z')
		}) // }}}

		it('end ndst 29.29 +13', func() { // {{{
			const d = new Date(2008, 2, 29, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2008-02-29T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2008-02-29T11:00:00.000Z')

			d.minus(TimeUnit::MONTHS, 13)

			expect(d.toString()).to.equal('2007-01-29T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2007-01-29T11:00:00.000Z')
		}) // }}}

		it('end ndst 29.28 +12', func() { // {{{
			const d = new Date(2008, 2, 29, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2008-02-29T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2008-02-29T11:00:00.000Z')

			d.minus(TimeUnit::MONTHS, 12)

			expect(d.toString()).to.equal('2007-02-28T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2007-02-28T11:00:00.000Z')
		}) // }}}

		it('end ndst 31.29 +8', func() { // {{{
			const d = new Date(2008, 10, 31, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2008-10-31T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2008-10-31T11:00:00.000Z')

			d.minus(TimeUnit::MONTHS, 8)

			expect(d.toString()).to.equal('2008-02-29T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2008-02-29T11:00:00.000Z')
		}) // }}}

		it('end ndst 31.28 +1', func() { // {{{
			const d = new Date(2006, 10, 31, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2006-10-31T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2006-10-31T11:00:00.000Z')

			d.minus(TimeUnit::MONTHS, 8)

			expect(d.toString()).to.equal('2006-02-28T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2006-02-28T11:00:00.000Z')
		}) // }}}

		it('end wdst 31.30 +8', func() { // {{{
			const d = new Date(2008, 8, 31, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2008-08-31T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2008-08-31T10:00:00.000Z')

			d.minus(TimeUnit::MONTHS, 8)

			expect(d.toString()).to.equal('2007-12-31T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2007-12-31T11:00:00.000Z')
		}) // }}}
	})

	describe('week', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.minus(TimeUnit::WEEKS, 1)

			expect(d.toString()).to.equal('2000-06-19T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-19T10:00:00.000Z')
		}) // }}}

		it('ndst +9', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.minus(TimeUnit::WEEKS, 9)

			expect(d.toString()).to.equal('2000-04-24T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-04-24T10:00:00.000Z')
		}) // }}}

		it('wdst +1', func() { // {{{
			const d = new Date(2000, 3, 28, 2, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-28T02:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-28T00:00:00.000Z')

			d.minus(TimeUnit::WEEKS, 1)

			expect(d.toString()).to.equal('2000-03-21T02:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-21T01:00:00.000Z')
		}) // }}}

		it('wdst +9', func() { // {{{
			const d = new Date(2000, 3, 28, 2, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-28T02:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-28T00:00:00.000Z')

			d.minus(TimeUnit::WEEKS, 9)

			expect(d.toString()).to.equal('2000-01-25T02:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2000-01-25T01:00:00.000Z')
		}) // }}}
	})

	describe('day', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.minus(TimeUnit::DAYS, 1)

			expect(d.toString()).to.equal('2000-06-25T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-25T10:00:00.000Z')
		}) // }}}

		it('ndst +40', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.minus(TimeUnit::DAYS, 40)

			expect(d.toString()).to.equal('2000-05-17T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-05-17T10:00:00.000Z')
		}) // }}}

		it('wdst losangeles +1', func() { // {{{
			const d = new Date(2016, 3, 13, 10, 0, 0, 0, 'America/Los_Angeles')

			expect(d.toString()).to.equal('2016-03-13T10:00:00.000-07:00')
			expect(d.toUTC().toString()).to.equal('2016-03-13T17:00:00.000Z')

			d.minus(TimeUnit::DAYS, 1)

			expect(d.toString()).to.equal('2016-03-12T10:00:00.000-08:00')
			expect(d.toUTC().toString()).to.equal('2016-03-12T18:00:00.000Z')
		}) // }}}

		it('wdst paris +1', func() { // {{{
			const d = new Date(2000, 3, 26, 3, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T03:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:00:00.000Z')

			d.minus(TimeUnit::DAYS, 1)

			expect(d.toString()).to.equal('2000-03-25T03:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-25T02:00:00.000Z')
		}) // }}}

		it('wdst paris +40', func() { // {{{
			const d = new Date(2000, 3, 26, 3, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T03:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:00:00.000Z')

			d.minus(TimeUnit::DAYS, 40)

			expect(d.toString()).to.equal('2000-02-15T03:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2000-02-15T02:00:00.000Z')
		}) // }}}

		it('y100 +2', func() { // {{{
			const d = new Date(100, 1, 2, 0, 0, 0, 0)

			expect(d.toString()).to.equal('0100-01-02T00:00:00.000Z')

			d.minus(TimeUnit::DAYS, 2)

			expect(d.toString()).to.equal('0099-12-31T00:00:00.000Z')
		}) // }}}
	})

	describe('hour', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.minus(TimeUnit::HOURS, 1)

			expect(d.toString()).to.equal('2000-06-26T11:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T09:00:00.000Z')
		}) // }}}

		it('ndst +12', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.minus(TimeUnit::HOURS, 12)

			expect(d.toString()).to.equal('2000-06-26T00:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-25T22:00:00.000Z')
		}) // }}}

		it('ndst +24', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.minus(TimeUnit::HOURS, 24)

			expect(d.toString()).to.equal('2000-06-25T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-25T10:00:00.000Z')
		}) // }}}

		it('wdst losangeles +24', func() { // {{{
			const d = new Date(2016, 3, 13, 10, 0, 0, 0, 'America/Los_Angeles')

			expect(d.toString()).to.equal('2016-03-13T10:00:00.000-07:00')
			expect(d.toUTC().toString()).to.equal('2016-03-13T17:00:00.000Z')

			d.minus(TimeUnit::HOURS, 24)

			expect(d.toString()).to.equal('2016-03-12T09:00:00.000-08:00')
			expect(d.toUTC().toString()).to.equal('2016-03-12T17:00:00.000Z')
		}) // }}}

		it('wdst paris +1', func() { // {{{
			const d = new Date(2000, 3, 26, 3, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T03:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:00:00.000Z')

			d.minus(TimeUnit::HOURS, 1)

			expect(d.toString()).to.equal('2000-03-26T01:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:00:00.000Z')
		}) // }}}

		it('wdst paris +12', func() { // {{{
			const d = new Date(2000, 3, 26, 3, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T03:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:00:00.000Z')

			d.minus(TimeUnit::HOURS, 12)

			expect(d.toString()).to.equal('2000-03-25T14:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-25T13:00:00.000Z')
		}) // }}}

		it('wdst paris +24', func() { // {{{
			const d = new Date(2000, 3, 26, 3, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T03:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:00:00.000Z')

			d.minus(TimeUnit::HOURS, 24)

			expect(d.toString()).to.equal('2000-03-25T02:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-25T01:00:00.000Z')
		}) // }}}
	})

	describe('minute', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.minus(TimeUnit::MINUTES, 1)

			expect(d.toString()).to.equal('2000-06-26T11:59:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T09:59:00.000Z')
		}) // }}}

		it('ndst +90', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.minus(TimeUnit::MINUTES, 90)

			expect(d.toString()).to.equal('2000-06-26T10:30:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T08:30:00.000Z')
		}) // }}}

		it('ndst +1440', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.minus(TimeUnit::MINUTES, 1440)

			expect(d.toString()).to.equal('2000-06-25T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-25T10:00:00.000Z')
		}) // }}}

		it('wdst +1', func() { // {{{
			const d = new Date(2000, 3, 26, 3, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T03:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:00:00.000Z')

			d.minus(TimeUnit::MINUTES, 1)

			expect(d.toString()).to.equal('2000-03-26T01:59:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:00.000Z')
		}) // }}}

		it('wdst +90', func() { // {{{
			const d = new Date(2000, 3, 26, 3, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T03:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:00:00.000Z')

			d.minus(TimeUnit::MINUTES, 90)

			expect(d.toString()).to.equal('2000-03-26T00:30:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-25T23:30:00.000Z')
		}) // }}}

		it('wdst +1440', func() { // {{{
			const d = new Date(2000, 3, 26, 3, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T03:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:00:00.000Z')

			d.minus(TimeUnit::MINUTES, 1440)

			expect(d.toString()).to.equal('2000-03-25T02:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-25T01:00:00.000Z')
		}) // }}}
	})

	describe('second', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.minus(TimeUnit::SECONDS, 1)

			expect(d.toString()).to.equal('2000-06-26T11:59:59.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T09:59:59.000Z')
		}) // }}}

		it('wdst +1', func() { // {{{
			const d = new Date(2000, 3, 26, 3, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T03:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:00:00.000Z')

			d.minus(TimeUnit::SECONDS, 1)

			expect(d.toString()).to.equal('2000-03-26T01:59:59.000+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.000Z')
		}) // }}}
	})

	describe('millisecond', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.minus(TimeUnit::MILLISECONDS, 1)

			expect(d.toString()).to.equal('2000-06-26T11:59:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T09:59:59.999Z')
		}) // }}}

		it('wdst +1', func() { // {{{
			const d = new Date(2000, 3, 26, 3, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T03:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:00:00.000Z')

			d.minus(TimeUnit::MILLISECONDS, 1)

			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')
		}) // }}}
	})
})