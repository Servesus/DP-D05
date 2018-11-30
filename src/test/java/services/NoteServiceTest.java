
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import utilities.AbstractTest;
import domain.Note;
import domain.Report;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/datasource.xml", "classpath:spring/config/packages.xml"
})
@Transactional
public class NoteServiceTest extends AbstractTest {

	@Autowired
	private NoteService		noteService;

	@Autowired
	private ReportService	reportService;


	@Test
	public void createTest() {
		final Note n = this.noteService.create();
		Assert.notNull(n);
	}

	@Test
	public void saveTest() {
		super.authenticate("customer1");
		final int reportId = this.getEntityId("report1");
		final Note note = this.noteService.create();
		String com = "Comentarios de autor";

		note.setAuthorComment(com);
		final Note n = this.noteService.save(note, reportId);
		final Collection<Note> notes = this.noteService.findAll();
		Assert.isTrue(notes.contains(n));

	}

	@Test
	public void saveTest2() {
		super.authenticate("customer1");
		final int noteId = this.getEntityId("note1");
		final int reportId = this.getEntityId("report1");
		Collection<String> customerComments;

		final Note note = this.noteService.findOne(noteId);

		customerComments = note.getCustomerComments();
		customerComments.add("Nuevo comentario del customer");

		note.setCustomerComments(customerComments);

		final Note n = this.noteService.save(note, reportId);

		Assert.notNull(this.noteService.findOne(n.getId()));
		Assert.isTrue(this.noteService.findOne(n.getId()).getCustomerComments()
				.equals(customerComments));
		Assert.isTrue(this.reportService.findOne(reportId).getNotes().contains(n));
	}

	@Test
	public void deleteTest() {
		super.authenticate("customer1");
		final int noteId = this.getEntityId("note1");
		final int reportId = this.getEntityId("report1");

		final Note note = this.noteService.findOne(noteId);
		final Report r = this.reportService.findOne(reportId);

		this.noteService.delete(note);
		Assert.isNull(this.noteService.findOne(noteId));
		
		Assert.isTrue(!r.getNotes().contains(note));
	}

}
