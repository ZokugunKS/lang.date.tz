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

describe('plus', func() {
	describe('year', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.plus(TimeUnit::YEARS, 1)

			expect(d.toString()).to.equal('2001-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2001-06-26T10:00:00.000Z')
		}) // }}}

		it('ndst +10', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.plus(TimeUnit::YEARS, 10)

			expect(d.toString()).to.equal('2010-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2010-06-26T10:00:00.000Z')
		}) // }}}

		it('ndst end 29.28 +1', func() { // {{{
			const d = new Date(2008, 2, 29, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2008-02-29T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2008-02-29T11:00:00.000Z')

			d.plus(TimeUnit::YEARS, 1)

			expect(d.toString()).to.equal('2009-02-28T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2009-02-28T11:00:00.000Z')
		}) // }}}

		it('ndst end 29.28 +4', func() { // {{{
			const d = new Date(2008, 2, 29, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2008-02-29T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2008-02-29T11:00:00.000Z')

			d.plus(TimeUnit::YEARS, 4)

			expect(d.toString()).to.equal('2012-02-29T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2012-02-29T11:00:00.000Z')
		}) // }}}

		it('wdst +1', func() { // {{{
			const d = new Date(2000, 3, 26, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')

			d.plus(TimeUnit::YEARS, 1)

			expect(d.toString()).to.equal('2001-03-26T01:59:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2001-03-25T23:59:59.999Z')
		}) // }}}
	})

	describe('month', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.plus(TimeUnit::MONTHS, 1)

			expect(d.toString()).to.equal('2000-07-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-07-26T10:00:00.000Z')
		}) // }}}

		it('ndst +3', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.plus(TimeUnit::MONTHS, 3)

			expect(d.toString()).to.equal('2000-09-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-09-26T10:00:00.000Z')
		}) // }}}

		it('wdst +1', func() { // {{{
			const d = new Date(2000, 3, 26, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')

			d.plus(TimeUnit::MONTHS, 1)

			expect(d.toString()).to.equal('2000-04-26T01:59:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-04-25T23:59:59.999Z')
		}) // }}}

		it('wdst +3', func() { // {{{
			const d = new Date(2000, 3, 26, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')

			d.plus(TimeUnit::MONTHS, 3)

			expect(d.toString()).to.equal('2000-06-26T01:59:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-25T23:59:59.999Z')
		}) // }}}

		it('end ndst 30.30 +1', func() { // {{{
			const d = new Date(2008, 5, 30, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2008-05-30T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2008-05-30T10:00:00.000Z')

			d.plus(TimeUnit::MONTHS, 1)

			expect(d.toString()).to.equal('2008-06-30T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2008-06-30T10:00:00.000Z')
		}) // }}}

		it('end ndst 31.30 +1', func() { // {{{
			const d = new Date(2008, 5, 31, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2008-05-31T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2008-05-31T10:00:00.000Z')

			d.plus(TimeUnit::MONTHS, 1)

			expect(d.toString()).to.equal('2008-06-30T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2008-06-30T10:00:00.000Z')
		}) // }}}

		it('end ndst 31.30 +4', func() { // {{{
			const d = new Date(2008, 5, 31, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2008-05-31T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2008-05-31T10:00:00.000Z')

			d.plus(TimeUnit::MONTHS, 4)

			expect(d.toString()).to.equal('2008-09-30T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2008-09-30T10:00:00.000Z')
		}) // }}}

		it('end ndst 29.29 +11', func() { // {{{
			const d = new Date(2008, 2, 29, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2008-02-29T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2008-02-29T11:00:00.000Z')

			d.plus(TimeUnit::MONTHS, 11)

			expect(d.toString()).to.equal('2009-01-29T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2009-01-29T11:00:00.000Z')
		}) // }}}

		it('end ndst 29.28 +12', func() { // {{{
			const d = new Date(2008, 2, 29, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2008-02-29T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2008-02-29T11:00:00.000Z')

			d.plus(TimeUnit::MONTHS, 12)

			expect(d.toString()).to.equal('2009-02-28T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2009-02-28T11:00:00.000Z')
		}) // }}}

		it('end ndst 31.29 +1', func() { // {{{
			const d = new Date(2008, 1, 31, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2008-01-31T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2008-01-31T11:00:00.000Z')

			d.plus(TimeUnit::MONTHS, 1)

			expect(d.toString()).to.equal('2008-02-29T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2008-02-29T11:00:00.000Z')
		}) // }}}

		it('end ndst 31.29 +13', func() { // {{{
			const d = new Date(2007, 1, 31, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2007-01-31T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2007-01-31T11:00:00.000Z')

			d.plus(TimeUnit::MONTHS, 13)

			expect(d.toString()).to.equal('2008-02-29T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2008-02-29T11:00:00.000Z')
		}) // }}}

		it('end ndst 31.28 +1', func() { // {{{
			const d = new Date(2006, 1, 31, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2006-01-31T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2006-01-31T11:00:00.000Z')

			d.plus(TimeUnit::MONTHS, 1)

			expect(d.toString()).to.equal('2006-02-28T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2006-02-28T11:00:00.000Z')
		}) // }}}

		it('end wdst 31.30 +3', func() { // {{{
			const d = new Date(2008, 8, 31, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2008-08-31T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2008-08-31T10:00:00.000Z')

			d.plus(TimeUnit::MONTHS, 3)

			expect(d.toString()).to.equal('2008-11-30T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2008-11-30T11:00:00.000Z')
		}) // }}}
	})

	describe('week', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.plus(TimeUnit::WEEKS, 1)

			expect(d.toString()).to.equal('2000-07-03T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-07-03T10:00:00.000Z')
		}) // }}}

		it('ndst +9', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.plus(TimeUnit::WEEKS, 9)

			expect(d.toString()).to.equal('2000-08-28T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-08-28T10:00:00.000Z')
		}) // }}}

		it('wdst +1', func() { // {{{
			const d = new Date(2000, 3, 26, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')

			d.plus(TimeUnit::WEEKS, 1)

			expect(d.toString()).to.equal('2000-04-02T01:59:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-04-01T23:59:59.999Z')
		}) // }}}

		it('wdst +9', func() { // {{{
			const d = new Date(2000, 3, 26, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')

			d.plus(TimeUnit::WEEKS, 9)

			expect(d.toString()).to.equal('2000-05-28T01:59:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-05-27T23:59:59.999Z')
		}) // }}}
	})

	describe('day', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.plus(TimeUnit::DAYS, 1)

			expect(d.toString()).to.equal('2000-06-27T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-27T10:00:00.000Z')
		}) // }}}

		it('ndst +40', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.plus(TimeUnit::DAYS, 40)

			expect(d.toString()).to.equal('2000-08-05T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-08-05T10:00:00.000Z')
		}) // }}}

		it('wdst losangeles +1', func() { // {{{
			const d = new Date(2016, 3, 12, 10, 0, 0, 0, 'America/Los_Angeles')

			expect(d.toString()).to.equal('2016-03-12T10:00:00.000-08:00')
			expect(d.toUTC().toString()).to.equal('2016-03-12T18:00:00.000Z')

			d.plus(TimeUnit::DAYS, 1)

			expect(d.toString()).to.equal('2016-03-13T10:00:00.000-07:00')
			expect(d.toUTC().toString()).to.equal('2016-03-13T17:00:00.000Z')
		}) // }}}

		it('wdst paris +1', func() { // {{{
			const d = new Date(2000, 3, 26, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')

			d.plus(TimeUnit::DAYS, 1)

			expect(d.toString()).to.equal('2000-03-27T01:59:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T23:59:59.999Z')
		}) // }}}

		it('wdst paris +40', func() { // {{{
			const d = new Date(2000, 3, 26, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')

			d.plus(TimeUnit::DAYS, 40)

			expect(d.toString()).to.equal('2000-05-05T01:59:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-05-04T23:59:59.999Z')
		}) // }}}

		it('y99 +2', func() { // {{{
			const d = new Date(99, 12, 31, 0, 0, 0, 0)

			expect(d.toString()).to.equal('0099-12-31T00:00:00.000Z')

			d.plus(TimeUnit::DAYS, 2)

			expect(d.toString()).to.equal('0100-01-02T00:00:00.000Z')
		}) // }}}
	})

	describe('hour', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.plus(TimeUnit::HOURS, 1)

			expect(d.toString()).to.equal('2000-06-26T13:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T11:00:00.000Z')
		}) // }}}

		it('ndst +12', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.plus(TimeUnit::HOURS, 12)

			expect(d.toString()).to.equal('2000-06-27T00:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T22:00:00.000Z')
		}) // }}}

		it('ndst +24', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.plus(TimeUnit::HOURS, 24)

			expect(d.toString()).to.equal('2000-06-27T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-27T10:00:00.000Z')
		}) // }}}

		it('wdst losangeles +24', func() { // {{{
			const d = new Date(2016, 3, 12, 10, 0, 0, 0, 'America/Los_Angeles')

			expect(d.toString()).to.equal('2016-03-12T10:00:00.000-08:00')
			expect(d.toUTC().toString()).to.equal('2016-03-12T18:00:00.000Z')

			d.plus(TimeUnit::HOURS, 24)

			expect(d.toString()).to.equal('2016-03-13T11:00:00.000-07:00')
			expect(d.toUTC().toString()).to.equal('2016-03-13T18:00:00.000Z')
		}) // }}}

		it('wdst paris +1', func() { // {{{
			const d = new Date(2000, 3, 26, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')

			d.plus(TimeUnit::HOURS, 1)

			expect(d.toString()).to.equal('2000-03-26T03:59:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:59:59.999Z')
		}) // }}}

		it('wdst paris +12', func() { // {{{
			const d = new Date(2000, 3, 26, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')

			d.plus(TimeUnit::HOURS, 12)

			expect(d.toString()).to.equal('2000-03-26T14:59:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T12:59:59.999Z')
		}) // }}}

		it('wdst paris +24', func() { // {{{
			const d = new Date(2000, 3, 26, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')

			d.plus(TimeUnit::HOURS, 24)

			expect(d.toString()).to.equal('2000-03-27T02:59:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-27T00:59:59.999Z')
		}) // }}}
	})

	describe('minute', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.plus(TimeUnit::MINUTES, 1)

			expect(d.toString()).to.equal('2000-06-26T12:01:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:01:00.000Z')
		}) // }}}

		it('ndst +90', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.plus(TimeUnit::MINUTES, 90)

			expect(d.toString()).to.equal('2000-06-26T13:30:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T11:30:00.000Z')
		}) // }}}

		it('ndst +1440', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.plus(TimeUnit::MINUTES, 1440)

			expect(d.toString()).to.equal('2000-06-27T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-27T10:00:00.000Z')
		}) // }}}

		it('wdst +1', func() { // {{{
			const d = new Date(2000, 3, 26, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')

			d.plus(TimeUnit::MINUTES, 1)

			expect(d.toString()).to.equal('2000-03-26T03:00:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:00:59.999Z')
		}) // }}}

		it('wdst +90', func() { // {{{
			const d = new Date(2000, 3, 26, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')

			d.plus(TimeUnit::MINUTES, 90)

			expect(d.toString()).to.equal('2000-03-26T04:29:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T02:29:59.999Z')
		}) // }}}

		it('wdst +1440', func() { // {{{
			const d = new Date(2000, 3, 26, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')

			d.plus(TimeUnit::MINUTES, 1440)

			expect(d.toString()).to.equal('2000-03-27T02:59:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-27T00:59:59.999Z')
		}) // }}}
	})

	describe('second', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.plus(TimeUnit::SECONDS, 1)

			expect(d.toString()).to.equal('2000-06-26T12:00:01.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:01.000Z')
		}) // }}}

		it('wdst +1', func() { // {{{
			const d = new Date(2000, 3, 26, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')

			d.plus(TimeUnit::SECONDS, 1)

			expect(d.toString()).to.equal('2000-03-26T03:00:00.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:00:00.999Z')
		}) // }}}
	})

	describe('millisecond', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.plus(TimeUnit::MILLISECONDS, 1)

			expect(d.toString()).to.equal('2000-06-26T12:00:00.001+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.001Z')
		}) // }}}

		it('wdst +1', func() { // {{{
			const d = new Date(2000, 3, 26, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')

			d.plus(TimeUnit::MILLISECONDS, 1)

			expect(d.toString()).to.equal('2000-03-26T03:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:00:00.000Z')
		}) // }}}
	})
})