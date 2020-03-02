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

describe('set', func() {
	describe('year', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.set(DateField::YEAR, 2001)

			expect(d.toString()).to.equal('2001-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2001-06-26T10:00:00.000Z')
		}) // }}}

		it('ndst -1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.set(DateField::YEAR, 1999)

			expect(d.toString()).to.equal('1999-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('1999-06-26T10:00:00.000Z')
		}) // }}}

		it('wdst +1', func() { // {{{
			const d = new Date(2000, 3, 26, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')

			d.set(DateField::YEAR, 2001)

			expect(d.toString()).to.equal('2001-03-26T01:59:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2001-03-25T23:59:59.999Z')
		}) // }}}
	})

	describe('month', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.set(DateField::MONTH, 7)

			expect(d.toString()).to.equal('2000-07-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-07-26T10:00:00.000Z')
		}) // }}}

		it('wdst +1', func() { // {{{
			const d = new Date(2000, 3, 26, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')

			d.set(DateField::MONTH, 4)

			expect(d.toString()).to.equal('2000-04-26T01:59:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-04-25T23:59:59.999Z')
		}) // }}}
	})

	describe('week', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.set(DateField::WEEK, 27)

			expect(d.toString()).to.equal('2000-07-03T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-07-03T10:00:00.000Z')
		}) // }}}

		it('wdst +1', func() { // {{{
			const d = new Date(2000, 3, 26, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')

			d.set(DateField::WEEK, 13)

			expect(d.toString()).to.equal('2000-04-02T01:59:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-04-01T23:59:59.999Z')
		}) // }}}
	})

	describe('day', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.set(DateField::DAY, 27)

			expect(d.toString()).to.equal('2000-06-27T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-27T10:00:00.000Z')
		}) // }}}

		it('wdst +1', func() { // {{{
			const d = new Date(2000, 3, 26, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')

			d.set(DateField::DAY, 27)

			expect(d.toString()).to.equal('2000-03-27T01:59:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T23:59:59.999Z')
		}) // }}}
	})

	describe('dow', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.set(DateField::DAY_OF_WEEK, 2)

			expect(d.toString()).to.equal('2000-06-27T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-27T10:00:00.000Z')
		}) // }}}

		it('wdst +1', func() { // {{{
			const d = new Date(2000, 3, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T10:00:00.000Z')

			d.set(DateField::DAY_OF_WEEK, 6)

			expect(d.toString()).to.equal('2000-03-25T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-25T11:00:00.000Z')
		}) // }}}
	})

	describe('doy', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.set(DateField::DAY_OF_YEAR, 179)

			expect(d.toString()).to.equal('2000-06-27T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-27T10:00:00.000Z')
		}) // }}}

		it('wdst +1', func() { // {{{
			const d = new Date(2000, 3, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T10:00:00.000Z')

			d.set(DateField::DAY_OF_YEAR, 85)

			expect(d.toString()).to.equal('2000-03-25T12:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-25T11:00:00.000Z')
		}) // }}}
	})

	describe('hour', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.set(DateField::HOUR, 13)

			expect(d.toString()).to.equal('2000-06-26T13:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T11:00:00.000Z')
		}) // }}}

		it('wdst +1', func() { // {{{
			const d = new Date(2000, 3, 26, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')

			d.set(DateField::HOUR, 2)

			expect(d.toString()).to.equal('2000-03-26T03:59:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:59:59.999Z')
		}) // }}}
	})

	describe('minute', func() {
		it('+1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.set(DateField::MINUTE, 1)

			expect(d.toString()).to.equal('2000-06-26T12:01:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:01:00.000Z')
		}) // }}}
	})

	describe('second', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.set(DateField::SECOND, 1)

			expect(d.toString()).to.equal('2000-06-26T12:00:01.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:01.000Z')
		}) // }}}
	})

	describe('millisecond', func() {
		it('ndst +1', func() { // {{{
			const d = new Date(2000, 6, 26, 12, 0, 0, 0, 'Europe/Paris')

			expect(d.toString()).to.equal('2000-06-26T12:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.000Z')

			d.set(DateField::MILLISECOND, 1)

			expect(d.toString()).to.equal('2000-06-26T12:00:00.001+02:00')
			expect(d.toUTC().toString()).to.equal('2000-06-26T10:00:00.001Z')
		}) // }}}
	})
})