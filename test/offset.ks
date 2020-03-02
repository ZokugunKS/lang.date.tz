#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'	for expect
	'..'
}

describe('offset', func() {
	describe('paris', func() { // {{{
		it('2015-06-15T09:03:01', func() { // {{{
			const d = new Date(2015, 6, 15, 9, 3, 1, 550, 'Europe/Paris')

			expect(d.getUTCOffset()).to.equal(2 * 60)
		}) // }}}

		it('2000-03-26T01:59:59', func() { // {{{
			const d = new Date(2000, 3, 26, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.getEpochTime()).to.equal(954032399999)
			expect(d.getUTCOffset()).to.equal(1 * 60)
			expect(d.toString()).to.equal('2000-03-26T01:59:59.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:59.999Z')

			/* d.setSeconds(10)

			expect(d.toString()).to.equal('2000-03-26T01:59:10.999+01:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T00:59:10.999Z')

			d.setSeconds(70)

			expect(d.toString()).to.equal('2000-03-26T03:00:10.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:00:10.999Z') */
		}) // }}}

		it('2000-03-26T02:00:00 bf', func() { // {{{
			const d = new Date(2000, 3, 26, 2, 0, 0, 0, 'Europe/Paris', true)

			expect(d.getEpochTime()).to.equal(954032400000)
			expect(d.getUTCOffset()).to.equal(2 * 60)
			expect(d.toString()).to.equal('2000-03-26T03:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:00:00.000Z')
		}) // }}}

		it('2000-03-26T02:00:00 af', func() { // {{{
			const d = new Date(2000, 3, 26, 2, 0, 0, 0, 'Europe/Paris', false)

			expect(d.getEpochTime()).to.equal(954032400000)
			expect(d.getUTCOffset()).to.equal(2 * 60)
			expect(d.toString()).to.equal('2000-03-26T03:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:00:00.000Z')
		}) // }}}

		it('2000-03-26T02:00:01', func() { // {{{
			const d = new Date(2000, 3, 26, 2, 0, 1, 0, 'Europe/Paris')

			expect(d.getEpochTime()).to.equal(954032401000)
			expect(d.getUTCOffset()).to.equal(2 * 60)
			expect(d.toString()).to.equal('2000-03-26T03:00:01.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:00:01.000Z')
		}) // }}}

		it('2000-03-26T03:00:00 bf', func() { // {{{
			const d = new Date(2000, 3, 26, 3, 0, 0, 0, 'Europe/Paris', true)

			expect(d.getEpochTime()).to.equal(954032400000)
			expect(d.getUTCOffset()).to.equal(2 * 60)
			expect(d.toString()).to.equal('2000-03-26T03:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:00:00.000Z')
		}) // }}}

		it('2000-03-26T03:00:00 af', func() { // {{{
			const d = new Date(2000, 3, 26, 3, 0, 0, 0, 'Europe/Paris', false)

			expect(d.getEpochTime()).to.equal(954032400000)
			expect(d.getUTCOffset()).to.equal(2 * 60)
			expect(d.toString()).to.equal('2000-03-26T03:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:00:00.000Z')
		}) // }}}

		it('2000-03-26T03:00:01', func() { // {{{
			const d = new Date(2000, 3, 26, 3, 0, 1, 0, 'Europe/Paris')

			expect(d.getEpochTime()).to.equal(954032401000)
			expect(d.getUTCOffset()).to.equal(2 * 60)
			expect(d.toString()).to.equal('2000-03-26T03:00:01.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-03-26T01:00:01.000Z')
		}) // }}}

		it('2000-10-29T01:59:59', func() { // {{{
			const d = new Date(2000, 10, 29, 1, 59, 59, 999, 'Europe/Paris')

			expect(d.getEpochTime()).to.equal(972777599999)
			expect(d.getUTCOffset()).to.equal(2 * 60)
			expect(d.toString()).to.equal('2000-10-29T01:59:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-10-28T23:59:59.999Z')
		}) // }}}

		it('2000-10-29T02:00:00 bf', func() { // {{{
			const d = new Date(2000, 10, 29, 2, 0, 0, 0, 'Europe/Paris', true)

			expect(d.getEpochTime()).to.equal(972777600000)
			expect(d.getUTCOffset()).to.equal(2 * 60)
			expect(d.toString()).to.equal('2000-10-29T02:00:00.000+02:00')
			expect(d.toUTC().toString()).to.equal('2000-10-29T00:00:00.000Z')
		}) // }}}

		it('2000-10-29T02:00:00 af', func() { // {{{
			const d = new Date(2000, 10, 29, 2, 0, 0, 0, 'Europe/Paris', false)

			expect(d.getEpochTime()).to.equal(972781200000)
			expect(d.getUTCOffset()).to.equal(1 * 60)
			expect(d.toString()).to.equal('2000-10-29T02:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2000-10-29T01:00:00.000Z')
		}) // }}}

		it('2000-10-29T02:59:59', func() { // {{{
			const d = new Date(2000, 10, 29, 2, 59, 59, 999, 'Europe/Paris')

			expect(d.getEpochTime()).to.equal(972781199999)
			expect(d.getUTCOffset()).to.equal(2 * 60)
			expect(d.toString()).to.equal('2000-10-29T02:59:59.999+02:00')
			expect(d.toUTC().toString()).to.equal('2000-10-29T00:59:59.999Z')
		}) // }}}

		it('2000-10-29T03:00:00 bf', func() { // {{{
			const d = new Date(2000, 10, 29, 3, 0, 0, 0, 'Europe/Paris', true)

			expect(d.getEpochTime()).to.equal(972781200000)
			expect(d.getUTCOffset()).to.equal(1 * 60)
			expect(d.toString()).to.equal('2000-10-29T02:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2000-10-29T01:00:00.000Z')
		}) // }}}

		it('2000-10-29T03:00:00 af', func() { // {{{
			const d = new Date(2000, 10, 29, 3, 0, 0, 0, 'Europe/Paris', false)

			expect(d.getEpochTime()).to.equal(972784800000)
			expect(d.getUTCOffset()).to.equal(1 * 60)
			expect(d.toString()).to.equal('2000-10-29T03:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2000-10-29T02:00:00.000Z')
		}) // }}}

		it('2000-10-29T04:00:00', func() { // {{{
			const d = new Date(2000, 10, 29, 4, 0, 0, 0, 'Europe/Paris')

			expect(d.getEpochTime()).to.equal(972788400000)
			expect(d.getUTCOffset()).to.equal(1 * 60)
			expect(d.toString()).to.equal('2000-10-29T04:00:00.000+01:00')
			expect(d.toUTC().toString()).to.equal('2000-10-29T03:00:00.000Z')
		}) // }}}
	}) // }}}

	describe('ny', func() { // {{{
		it('2008-03-09T01:59:59', func() { // {{{
			const d = new Date(2008, 3, 9, 1, 59, 59, 999, 'America/New_York')

			expect(d.getUTCOffset()).to.equal(-5 * 60)
			expect(d.getEpochTime()).to.equal(1205045999999)
			expect(d.toString()).to.equal('2008-03-09T01:59:59.999-05:00')
			expect(d.toUTC().toString()).to.equal('2008-03-09T06:59:59.999Z')
		}) // }}}

		it('2008-03-09T02:00:00', func() { // {{{
			const d = new Date(2008, 3, 9, 2, 0, 0, 0, 'America/New_York')

			expect(d.getUTCOffset()).to.equal(-4 * 60)
			expect(d.getEpochTime()).to.equal(1205046000000)
			expect(d.toString()).to.equal('2008-03-09T03:00:00.000-04:00')
			expect(d.toUTC().toString()).to.equal('2008-03-09T07:00:00.000Z')
		}) // }}}
	}) // }}}

	describe('melbourne', func() { // {{{
		it('2008-04-06T02:59:59', func() { // {{{
			const d = new Date(2008, 4, 6, 2, 59, 59, 999, 'Australia/Melbourne')

			expect(d.getEpochTime()).to.equal(1207411199999)
			expect(d.getUTCOffset()).to.equal(11 * 60)
			expect(d.toString()).to.equal('2008-04-06T02:59:59.999+11:00')
			expect(d.toUTC().toString()).to.equal('2008-04-05T15:59:59.999Z')
		}) // }}}

		it('2008-04-06T03:00:00 bf', func() { // {{{
			const d = new Date(2008, 4, 6, 3, 0, 0, 0, 'Australia/Melbourne', true)

			expect(d.getEpochTime()).to.equal(1207411200000)
			expect(d.getUTCOffset()).to.equal(10 * 60)
			expect(d.toString()).to.equal('2008-04-06T02:00:00.000+10:00')
			expect(d.toUTC().toString()).to.equal('2008-04-05T16:00:00.000Z')
		}) // }}}

		it('2008-04-06T03:00:00 af', func() { // {{{
			const d = new Date(2008, 4, 6, 3, 0, 0, 0, 'Australia/Melbourne', false)

			expect(d.getEpochTime()).to.equal(1207414800000)
			expect(d.getUTCOffset()).to.equal(10 * 60)
			expect(d.toString()).to.equal('2008-04-06T03:00:00.000+10:00')
			expect(d.toUTC().toString()).to.equal('2008-04-05T17:00:00.000Z')
		}) // }}}
	}) // }}}

	describe('santiago', func() { // {{{
		it('2008-03-29T23:59:59', func() { // {{{
			const d = new Date(2008, 3, 29, 23, 59, 59, 999, 'America/Santiago')

			expect(d.getEpochTime()).to.equal(1206845999999)
			expect(d.getUTCOffset()).to.equal(-3 * 60)
			expect(d.toString()).to.equal('2008-03-29T23:59:59.999-03:00')
			expect(d.toUTC().toString()).to.equal('2008-03-30T02:59:59.999Z')
		}) // }}}

		it('2008-03-30T00:00:00 bf', func() { // {{{
			const d = new Date(2008, 3, 30, 0, 0, 0, 0, 'America/Santiago', true)

			expect(d.getEpochTime()).to.equal(1206846000000)
			expect(d.getUTCOffset()).to.equal(-4 * 60)
			expect(d.toString()).to.equal('2008-03-29T23:00:00.000-04:00')
			expect(d.toUTC().toString()).to.equal('2008-03-30T03:00:00.000Z')
		}) // }}}

		it('2008-03-30T00:00:00 af', func() { // {{{
			const d = new Date(2008, 3, 30, 0, 0, 0, 0, 'America/Santiago', false)

			expect(d.getEpochTime()).to.equal(1206849600000)
			expect(d.getUTCOffset()).to.equal(-4 * 60)
			expect(d.toString()).to.equal('2008-03-30T00:00:00.000-04:00')
			expect(d.toUTC().toString()).to.equal('2008-03-30T04:00:00.000Z')
		}) // }}}
	}) // }}}
})