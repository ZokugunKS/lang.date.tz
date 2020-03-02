#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'		for expect
	'..'
}

describe('basic', func() {
	it('clone', func() { // {{{
		const d1 = new Date(2015, 6, 15, 9, 3, 1, 550, 'Europe/Paris')

		expect(d1.toString()).to.equal('2015-06-15T09:03:01.550+02:00')

		const d2 = d1.clone()

		expect(d2.getTimezone().name()).to.equal('Europe/Paris')
		expect(d2.toString()).to.equal('2015-06-15T09:03:01.550+02:00')
	})

	it('create.num.dt.tm.ms', func() { // {{{
		const d = new Date(2015, 6, 15, 9, 3, 1, 550, 'Europe/Paris')

		expect(d.toString()).to.equal('2015-06-15T09:03:01.550+02:00')
	}) // }}}

	it('create.num.dt', func() { // {{{
		const d = new Date(2015, 6, 15, 'Europe/Paris')

		expect(d.toString()).to.equal('2015-06-15T00:00:00.000+02:00')
	}) // }}}

	it('create.clone', func() { // {{{
		const d1 = new Date(2015, 6, 15, 9, 3, 1, 550, 'Europe/Paris')

		const d2 = new Date(d1)

		expect(d2.getTimezone().name()).to.equal('Europe/Paris')
		expect(d2.toString()).to.equal('2015-06-15T09:03:01.550+02:00')
	}) // }}}

	it('create.date', func() { // {{{
		const d1 = new Date(2015, 6, 15, 9, 3, 1, 550, 'Europe/Paris')

		expect(d1.toString()).to.equal('2015-06-15T09:03:01.550+02:00')

		const d2 = new Date(d1, 'Asia/Tokyo')

		expect(d2.getTimezone().name()).to.equal('Asia/Tokyo')
		expect(d2.toString()).to.equal('2015-06-15T16:03:01.550+09:00')
	}) // }}}

	it('create.epoch', func() { // {{{
		const d1 = new Date(2015, 6, 15, 9, 3, 1, 550, 'Europe/Paris')

		const d2 = new Date(d1.getEpochTime())

		expect(d2.getTimezone().name()).to.equal('Etc/UTC')
		expect(d2.toString()).to.equal('2015-06-15T07:03:01.550Z')

		const d3 = new Date(d1.getEpochTime(), 'Asia/Tokyo')

		expect(d3.getTimezone().name()).to.equal('Asia/Tokyo')
		expect(d3.toString()).to.equal('2015-06-15T16:03:01.550+09:00')
	}) // }}}

	it('getDSTOffset', func() { // {{{
		const d = new Date(2015, 6, 15, 9, 3, 1, 550, 'Europe/Paris')

		expect(d.getDSTOffset()).to.equal(1 * 60)
	}) // }}}

	it('getEpochTime', func() { // {{{
		const d = new Date(2015, 6, 15, 9, 3, 1, 550, 'Europe/Paris')

		expect(d.getEpochTime()).to.equal(1434351781550)
	}) // }}}

	it('getTimezone', func() { // {{{
		const d = new Date(2015, 6, 15, 9, 3, 1, 550, 'Europe/Paris')

		expect(d.getTimezone().name()).to.equal('Europe/Paris')
	}) // }}}

	it('isInDST', func() { // {{{
		const d = new Date(2015, 6, 15, 9, 3, 1, 550, 'Europe/Paris')

		expect(d.isInDST()).to.equal(true)
	}) // }}}

	it('setTimezone', func() { // {{{
		const d = new Date(2015, 6, 15, 9 , 3, 1, 550, 'Europe/Paris')

		expect(d.toString()).to.equal('2015-06-15T09:03:01.550+02:00')

		d.setTimezone('Asia/Tokyo')

		expect(d.toString()).to.equal('2015-06-15T16:03:01.550+09:00')

		d.setTimezone('America/New_York')

		expect(d.toString()).to.equal('2015-06-15T03:03:01.550-04:00')
	}) // }}}
})